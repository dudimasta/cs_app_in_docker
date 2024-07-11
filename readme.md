## Routines to run in a docker container
1. If you try to run docker on a VM, then from host run:
	i. <code>Set-VMProcessor [VMName] -ExposeVirtualizationExtensions $true </code>
2. Restore packages:
	i. dotnet build --no-cache
1. Publish .NET app:
	i. .NET CLI: dotnet publish -c Release
1. build for docker
	i. console: docker build -t foobar_core_01containerreg.azurecr.io/foofar_core_01-image -f Dockerfile .

1. Manage a container - sample commands:
	i. docker start foofar_core_01
	i. docker stop foofar_core_01
	i. docker attach --sig-proxy=false foofar_core_01
	i. docker stop foofar_core_01
	i. delete: docker rm foofar_core_01
1. Push to Azure Container Registry
	i. az login --use-device-code --tenant [MY-TANANT-UUID]
	i. az acr login --name fooBar_core_01containerreg
	i. optionally (if did not tag before):
		docker tag foofar_core_01-image fooBar_core_01containerreg.azurecr.io/foofar_core_01-image
	i. docker push fooBar_core_01containerreg.azurecr.io/foofar_core_01-image

#Usefull commands:
- docker images - lista zainstalowanych obrazów
- docker ps -a - lista kontenerów zainstalowanych (uruchomionych i zatrzymanych)
- docker start [id]
- docker stop [id]
- docker attach [id] - podłączenie pod stdio
- docker exec -it [id] bash - połączenie do basha kontenera
