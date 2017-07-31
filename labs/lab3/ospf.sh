#!/bin/bash
# stage scripts execute command outside of container instance on custom port

# configure L3 interfaces on leaf1
curl -sX PATCH -d '{"IntfRef":"fpPort1", "AdminState":"UP"}' 'http://localhost:8001/public/v1/config/Port'
curl -sX PATCH -d '{"IntfRef":"fpPort2", "AdminState":"UP"}' 'http://localhost:8001/public/v1/config/Port'
curl -sX POST -d '{"IntfRef":"fpPort1", "AdminState":"UP", "IpAddr":"10.1.1.1/30"}' 'http://localhost:8001/public/v1/config/IPv4Intf'
curl -sX POST -d '{"IntfRef":"fpPort2", "AdminState":"UP", "IpAddr":"10.1.3.1/30"}' 'http://localhost:8001/public/v1/config/IPv4Intf'
curl -sX POST -d '{"Name":"Loopback1"}' 'http://localhost:8001/public/v1/config/LogicalIntf'
curl -sX POST -d '{"IntfRef":"Loopback1", "AdminState":"UP", "IpAddr":"10.0.0.1/32"}' 'http://localhost:8001/public/v1/config/IPv4Intf'
#ospf
echo "\nconfig ospf leaf1"
#cfg Area
curl  -H "Content-Type: application/json" -d '{"AreaId":"0.0.0.1", "AdminState":"UP"}'  http://localhost:8001/public/v1/config/Ospfv2Area
#cfg Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.1.1", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"PointToPoint"}'  http://localhost:8001/public/v1/config/Ospfv2Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.3.1", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"PointToPoint"}'  http://localhost:8001/public/v1/config/Ospfv2Intf
#cfg global
curl -sX PATCH -i "Content-Type: application/json" -d '{"Vrf":"default", "RouterId":"1.1.1.1", "AdminState":"UP"}'  http://localhost:8001/public/v1/config/Ospfv2Global

# configure L3 interfaces on leaf2
curl -sX PATCH -d '{"IntfRef":"fpPort1", "AdminState":"UP"}' 'http://localhost:8002/public/v1/config/Port'
curl -sX PATCH -d '{"IntfRef":"fpPort2", "AdminState":"UP"}' 'http://localhost:8002/public/v1/config/Port'
curl -sX POST -d '{"IntfRef":"fpPort1", "AdminState":"UP", "IpAddr":"10.1.1.2/30"}' 'http://localhost:8002/public/v1/config/IPv4Intf'
curl -sX POST -d '{"IntfRef":"fpPort2", "AdminState":"UP", "IpAddr":"10.1.2.1/30"}' 'http://localhost:8002/public/v1/config/IPv4Intf'
curl -sX POST -d '{"Name":"Loopback1"}' 'http://localhost:8002/public/v1/config/LogicalIntf'
curl -sX POST -d '{"IntfRef":"Loopback1", "AdminState":"UP", "IpAddr":"10.0.0.2/32"}' 'http://localhost:8002/public/v1/config/IPv4Intf'

echo "\nconfig ospf leaf2"
#ospf
#cfg Area
curl  -H "Content-Type: application/json" -d '{"AreaId":"0.0.0.1", "AdminState":"UP"}'  http://localhost:8002/public/v1/config/Ospfv2Area
#cfg Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.1.2", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"PointToPoint"}'  http://localhost:8002/public/v1/config/Ospfv2Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.2.1", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"PointToPoint"}'  http://localhost:8002/public/v1/config/Ospfv2Intf
#cfg global
curl -sX PATCH -i "Content-Type: application/json" -d '{"Vrf":"default", "RouterId":"1.1.1.2", "AdminState":"UP"}'  http://localhost:8002/public/v1/config/Ospfv2Global


# configure L3 interfaces on leaf3
curl -sX PATCH -d '{"IntfRef":"fpPort1", "AdminState":"UP"}' 'http://localhost:8003/public/v1/config/Port'
curl -sX PATCH -d '{"IntfRef":"fpPort2", "AdminState":"UP"}' 'http://localhost:8003/public/v1/config/Port'
curl -sX POST -d '{"IntfRef":"fpPort1", "AdminState":"UP", "IpAddr":"10.1.3.2/30"}' 'http://localhost:8003/public/v1/config/IPv4Intf'
curl -sX POST -d '{"IntfRef":"fpPort2", "AdminState":"UP", "IpAddr":"10.1.2.2/30"}' 'http://localhost:8003/public/v1/config/IPv4Intf'
curl -sX POST -d '{"Name":"Loopback1"}' 'http://localhost:8003/public/v1/config/LogicalIntf'
curl -sX POST -d '{"IntfRef":"Loopback1", "AdminState":"UP", "IpAddr":"10.0.0.3/32"}' 'http://localhost:8003/public/v1/config/IPv4Intf'
echo "\nconfig ospf leaf3"
#ospf
#cfg Area
curl  -H "Content-Type: application/json" -d '{"AreaId":"0.0.0.1", "AdminState":"UP"}'  http://localhost:8003/public/v1/config/Ospfv2Area
#cfg Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.3.2", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"PointToPoint"}'  http://localhost:8003/public/v1/config/Ospfv2Intf
curl  -H "Content-Type: application/json" -d '{"IpAddress":"10.1.2.2", "AddressLessIfIdx":0, "AdminState":"UP","AreaId":"0.0.0.1", "Type":"PointToPoint"}'  http://localhost:8003/public/v1/config/Ospfv2Intf
#cfg global
curl -sX PATCH -i "Content-Type: application/json" -d '{"Vrf":"default", "RouterId":"1.1.1.3", "AdminState":"UP"}'  http://localhost:8003/public/v1/config/Ospfv2Global
