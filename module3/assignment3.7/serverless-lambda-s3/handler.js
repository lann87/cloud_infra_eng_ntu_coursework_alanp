'use strict'

// Import required dependencies
const util = require('util')
const AWS = require('aws-sdk')
const Fixy = require('fixy')              // Library for fixed-width file handling
const Papa = require('papaparse')         // Library for CSV parsing
const fixySchema = require('./schema.js') // Import fixed-width format schema
const s3 = new AWS.S3()                   // Initialize S3 client

// Main Lambda function to process CSV files
module.exports.processCSV = async (event, context) => {
   // Extract bucket and file information from the S3 event
   const csvBucket = event.Records[0].s3.bucket.name
   const csvKey = event.Records[0].s3.object.key
   const fixedWidthBucket = process.env.FIXED_WIDTH_BUCKET
   const fixedWidthKey = csvKey.replace('.csv', '.txt')  // Change file extension for output

   try {
       // Load the CSV file from S3
       const response = await s3
           .getObject({ Bucket: csvBucket, Key: csvKey })
           .promise()

       /* Data Transformation Process:
        * 1. Read CSV from S3
        * 2. Parse CSV to array
        * 3. Convert to fixed-width format
        * 4. Save to output bucket
        */
       
       // Convert S3 object to string and parse CSV
       const csvString = response.Body.toString()
       const parsedData = Papa.parse(csvString).data
       const headers = parsedData.shift()  // Remove and store header row

       // Helper function to convert array rows to objects with header keys
       // Example Input: ['Josh', 'Stevens', 'josh@gmail.com', '123-456-7890']
       // Example Output: { First: 'Josh', Last: 'Stevens', Email: 'josh@gmail.com', Phone: '123-456-7890' }
       const mappingFunc = row => {
           let dataObj = {}
           for (let i = 0; i < headers.length; i++) {
               dataObj[headers[i]] = row[i]
           }
           return dataObj
       }

       // Transform all rows and convert to fixed-width format
       const fixyData = parsedData.map(mappingFunc)
       const fixedWidthString = Fixy.unparse(fixySchema, fixyData)

       // Save the transformed fixed-width file to output S3 bucket
       await s3
           .putObject({
               Bucket: fixedWidthBucket,
               Key: fixedWidthKey,
               Body: fixedWidthString
           })
           .promise()

   } catch (error) {
       console.error(error)  // Log any errors that occur during processing
   }
}
