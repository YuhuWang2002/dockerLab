#!/bin/bash
# stage scripts execute command outside of container instance on custom port

# configure L3 interfaces on leaf1
#ospf
echo "\nconfig ospf leaf1"
#cfg Area
curl  -H "Content-Type: application/json" -d '{"AreaId":"0.0.0.1", "AdminState":"UP"}'  http://localhost:8001/public/v1/config/Ospfv2Area
#cfg Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.1.1", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"Broadcast"}'  http://localhost:8001/public/v1/config/Ospfv2Intf

#cfg global
curl  -H "Content-Type: application/json" -d '{"Vrf":"default", "RouterId":"1.1.1.1", "AdminState":"UP"}'  http://localhost:8001/public/v1/config/Ospfv2Global

# configure L3 interfaces on leaf2
echo "\nconfig ospf leaf2"
#ospf
#cfg Area
curl  -H "Content-Type: application/json" -d '{"AreaId":"0.0.0.1", "AdminState":"UP"}'  http://localhost:8002/public/v1/config/Ospfv2Area
#cfg Intf
curl  -H  "Content-Type: application/json" -d '{"IpAddress":"10.1.1.2", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"Broadcast"}'  http://localhost:8002/public/v1/config/Ospfv2Intf
#cfg global
curl -H "Content-Type: application/json" -d '{"Vrf":"default", "RouterId":"1.1.1.2", "AdminState":"UP"}'  http://localhost:8002/public/v1/config/Ospfv2Global


# configure L3 interfaces on leaf3
echo "\nconfig ospf leaf3"
#ospf
#cfg Area
curl  -H "Content-Type: application/json" -d '{"AreaId":"0.0.0.1", "AdminState":"UP"}'  http://localhost:8003/public/v1/config/Ospfv2Area
#cfg Intf
curl  -H  "Content-Type: application/json" -d '{"IpAddress":"10.1.1.6", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"Broadcast"}'  http://localhost:8003/public/v1/config/Ospfv2Intf

#cfg global
curl -H "Content-Type: application/json" -d '{"Vrf":"default", "RouterId":"1.1.1.3", "AdminState":"UP"}'  http://localhost:8003/public/v1/config/Ospfv2Global
