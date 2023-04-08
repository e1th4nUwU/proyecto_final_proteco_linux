## Cool logo
echo -e "\e[35m
-----------------------------------------------
\e[36m██╗███╗░░██╗███████╗░█████╗░░██████╗██╗░██████╗
██║████╗░██║██╔════╝██╔══██╗██╔════╝██║██╔════╝
██║██╔██╗██║█████╗░░██║░░██║╚█████╗░██║╚█████╗░
██║██║╚████║██╔══╝░░██║░░██║░╚═══██╗██║░╚═══██╗
██║██║░╚███║██║░░░░░╚█████╔╝██████╔╝██║██████╔╝
╚═╝╚═╝░░╚══╝╚═╝░░░░░░╚════╝░╚═════╝░╚═╝╚═════╝░
\e[35m-----------------------------------------------"


## RAM Usage
echo -e "\e[36m█▀█ ▄▀█ █▀▄▀█
█▀▄ █▀█ █░▀░█
"
# Get the memory usage in MiB and filter the output to only show the Mem row
mem_info=$(free -m | grep Mem)

# Extract the total used and free memory values as strings
total_mem=$(echo $mem_info | awk '{print $2}')
used_mem=$(echo $mem_info | awk '{print $3}')
free_mem=$(echo $mem_info | awk '{print $4}')

# Show memory values
echo -e "\e[1;35mTotal:\e[0m $total_mem MiB"
echo -e "\e[1;35mUtilizada:\e[0m $used_mem MiB"
echo -e "\e[1;35mLibre:\e[0m $free_mem MiB"


## System Architecture
echo -e "\e[35m-----------------------------------------------\e[36m
▄▀█ █▀█ █▀█ █░█ █ ▀█▀ █▀▀ █▀▀ ▀█▀ █░█ █▀█ ▄▀█
█▀█ █▀▄ ▀▀█ █▄█ █ ░█░ ██▄ █▄▄ ░█░ █▄█ █▀▄ █▀█"
architecture=$(uname -m)
echo -e "
\e[1;35m$architecture\e[0m"

## OS Version
echo -e "\e[35m-----------------------------------------------\e[36m
█▀ █▀█
▄█ █▄█"

# Extract OS name and Kernel
os_name=$(sed -n 's/PRETTY_NAME="\(.*\)"/\1/p' /etc/os-release)
kernel=$(uname -r)

# Show values
echo -e "\e[1;35mSistema operativo:\e[0m $os_name"
echo -e "\e[1;35mKernel:\e[0m $kernel"
echo -e "\e[35m-----------------------------------------------\e[0m
"
