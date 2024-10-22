// Default configuration for all fields - sets padding settings
const defaultConfig = {
  padding_position: 'end',     // Add padding at the end of each field
  padding_symbol: ' '          // Use space as padding character
}

// Export array defining the fixed-width file structure
module.exports = [
  {
      name: 'First',           // First name field
      width: 20,               // Allocate 20 characters
      ...defaultConfig         // Use default padding config
  },
  {
      name: 'Last',            // Last name field
      width: 20,               // Allocate 20 characters  
      ...defaultConfig         // Use default padding config
  },
  {
      name: 'Email',           // Email address field
      width: 50,               // Allocate 50 characters
      ...defaultConfig         // Use default padding config
  },
  {
      name: 'Phone',           // Phone number field
      width: 18,               // Allocate 18 characters
      ...defaultConfig         // Use default padding config
  }
]

/* 
This configuration defines a fixed-width format where:
- Each field is padded with spaces at the end
- First and Last name get 20 characters each
- Email gets 50 characters
- Phone gets 18 characters
Total width of each record: 108 characters
*/