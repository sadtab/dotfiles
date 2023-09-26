ara-cli Application --create-project --app ./demo --target-os EBLinux

ara-cli Application --generate-cmake --app ./demo --target-os EBLinux

ara-cli RunPluget --name araEmManifestGen.pluget --input ./demo --output ./demo --path ./demo/plugets/araEmManifestGen.pluget

ara-cli Application --app ./demo
ara-cli Application --app ./demo --run-tests

ara-cli Application --clean --app ./demo --target-os EBLinux

ara-cli CreateAppContainer --app-dir ./demo --config-dir ~./demo/generated --container-dir ./demo/container

ara-cli TargetOperation --app-dir ./demo
	
ara-cli DeployAppContainer --app-dir ./demo	
	
start qemu :
	ara-network -a -N 1
	ara-cli RunQemu --start 1	
	
stop qemu
	ara-cli RunQemu --stop 1
	ara-network -r -N 1
	
ssh to qemu:
	ssh -o StrictHostKeyChecking=no root@192.168.7.1
	ssh -o StrictHostKeyChecking=no root@fd00::eb:1
	
IP of adaptive component
	ara-cli TargetOperation --target-host fd00::eb:1  --remote-command "runc exec adaptivecore-container ifconfig"
	ara-cli TargetOperation --target-host 192.168.7.1 --remote-command "runc exec adaptivecore-container ifconfig"

[run the app]
In host machine
	ara-cli TargetOperation --app ~/workspace/demo --remote-command "runc exec demo /opt/demo/bin/demo"
 
In target machine
	root@corbos-linux-2:/# runc exec demo /opt/demo/bin/demo

[systemctl]
	systemctl status demo
	systemctl start demo
	systemctl stop demo
	systemctl restart demo

[stop the app]

