#!/bin/bash
configPath="/home/${USER}/Desktop/PycharmProjects/lab/config/run-service.yaml"
servicesPath="/home/${USER}/Desktop/PycharmProjects/lab/capability"
capabilityPath=`yq '.runConfig.basePath' ${configPath} `
for service in $(yq eval -o=j ${configPath} | jq -cr '.runConfig.services[]'); do
    name=`echo $service | yq '.name'`
    path=`echo $service | yq '.path'`
    action=`echo $service | yq '.action'`
    full_compose_path="$servicesPath"/"${path}"
    echo "startig podman compose for: " $name
    echo "compose file path:          "${full_compose_path}
    podman-compose -f  "${full_compose_path}"   "${action}"  -d 
    echo =============================
done


# podman-compose -f ${grafana} -f ${openSearch} -f ${fluetBit} -f ${services} up -d