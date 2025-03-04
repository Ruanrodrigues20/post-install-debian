# Post Install Debian  

Welcome to **POST INSTALL DEBIAN**! This is an automated script to set up and customize Debian systems. It includes functions for:  

- System update  
- Installation of essential programs  
- Installation of Flatpaks  
- Installation of `.deb` packages  
- Installation of IntelliJ IDEA  

## Prerequisites  

Before running the script, make sure you have:  

- Root access (sudo)  
- Internet connection  
- Essential dependencies installed (such as `curl`, `wget`, `apt`, etc.)  

## Project Structure  

```plaintext
├── bin
│   ├── install_flatpaks.sh       # Script to install Flatpaks
│   ├── install_intellij.sh       # Script to install IntelliJ IDEA
│   ├── install_programs_debs.sh  # Script to install .deb packages
│   ├── install_programs.sh       # Script to install essential programs
│   └── system_update.sh          # Script to update the system
├── config
│   └── settings.conf             # Configuration file
├── lib
│   └── utils.sh                 # Utility functions
├── logs
│   └── script.log                # Script execution log
├── LICENSE.txt                   # License file
├── README.md                     # This file
└── install.sh                    # Installation script
```  

## How to Use  

1. Clone the repository:  
   ```bash
   git clone git@github.com:Ruanrodrigues20/post-install-debian.git
   cd post-install-debian
   ```  

2. Make the `install.sh` script executable:  
   ```bash
   chmod +x install.sh
   ```  

3. Run the script:  
   ```bash
   sudo ./install.sh
   ```  

This will start configuring your system with the steps described above.  

## Configuration  

The project configurations are stored in the `config/settings.conf` file. Edit this file to customize script behavior, such as download directories and the IntelliJ IDEA version to be installed.  

## License  

This project is licensed under the [MIT License](LICENSE.txt).  

## Contribution  

Contributions are welcome! Feel free to open issues or pull requests to improve the project.  

