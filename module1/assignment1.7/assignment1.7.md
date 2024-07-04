Assignment1.7 - Brief

We have learn much about Processes and Threads. By that, 
you should able to know the key points of Processes and Threads.

You may use any resources available online for research and 
create your own differentiation of the two concepts.

1.  Create a table to differentiate between threads and processes
```sh
|              Threads              |               Processes               |
|Def: Smallest execution unit in a  |Def: Independent instances with their  |
|process, sharing resources.        |own resources.                         |
|                                   |                                       |
|Faster and easier communications   |Inter-process communication or IPC is  |
|within the same addr space on RAM. |a complex system.                      |
|                                   |                                       |
|Termination = Quicker              |Termination = Slower                   |
|                                   |                                       |
|Threads consumes less resources as |Processes consumes more resources as   |
|they share the same resource of    |each process requires its own memory   |
|their parent processes             |and resources                          |
|                                   |                                       |
|Ctrl Blk: Each thread uses its own |Ctrl Blk: Each process has its PCB     |
|Thread Control Block(TCB) but share|containing information like process ID,|
|the same PCB of its parent process |state, priority and memory pointers    |

```

2.  Create another table to differentiate between multi-threading and multi-processing
```sh
|          Multi-Threading          |             Multi-Processing          |
|Def: MT involves running multiple  |Def: Multiple processes running at the |
|threads within the same process    |same time with its own memory space and|
|running concurrently               |resources                              |
|                                   |                                       |
|Execution of multiple threads are  |Multi proccess are executed in parallel|
|done in parallel                   |often on different CPUs or cores       |
|                                   |                                       |
|Threads shares the same memory and |Processes do not share memory and res  |
|resources of the parent process,   |resources which provide better security|
|this allow efficient communication |due to the isolation                   |
|and data sharing                   |                                       |
|                                   |                                       |
|Lower overhead in terms of memory  |Higher overhead due to separate memory |
|and resource usage as threads share|spaces are needed and complex Inter    |
|the same address space             |Process Communication(IPC)             |
|                                   |                                       |
|Use Case: Suitable for task require|Use Case: Used for task that require   |
|frequent communication and data    |strong isolation and independence, such|
|sharing like real-time app and user|as running multi instances of a server |
|interfaces                         |or performing diferent task that do not|
|                                   |require data sharing                   |

```
