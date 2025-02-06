set -U fish_user_paths $fish_user_paths ~/.local/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
    alias ls="ls -l"
    alias ghe="gh copilot explain"
    alias ghs="gh copilot suggest"



    #alias function ssd
    function ssdstatus
    	sudo smartctl -i /dev/nvme0n1
    	sudo smartctl -H /dev/nvme0n1
    	sudo smartctl -a /dev/nvme0n1
	sudo smartctl -t long /dev/sda
    end
    # alias function update
    function update
	sudo apt update
	sudo apt upgrade -y
	sudo apt full-upgrade -y
	sudo apt autoremove
    end
end	

