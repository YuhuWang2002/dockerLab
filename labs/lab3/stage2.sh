#!/bin/bash
# stage scripts execute command outside of container instance on custom port

# configure L3 interfaces on leaf1
curl -sX PATCH -d '{"IntfRef":"fpPort1", "AdminState":"UP"}' 'http://localhost:8001/public/v1/config/Port'
curl -sX POST -d '{"IntfRef":"fpPort1", "AdminState":"UP", "IpAddr":"10.1.1.1/24"}' 'http://localhost:8001/public/v1/config/IPv4Intf'
curl -sX POST -d '{"Name":"Loopback1"}' 'http://localhost:8001/public/v1/config/LogicalIntf'
curl -sX POST -d '{"IntfRef":"Loopback1", "AdminState":"UP", "IpAddr":"10.0.0.1/32"}' 'http://localhost:8001/public/v1/config/IPv4Intf'

# configure L3 interfaces on leaf2
curl -sX PATCH -d '{"IntfRef":"fpPort1", "AdminState":"UP"}' 'http://localhost:8002/public/v1/config/Port'
curl -sX POST -d '{"IntfRef":"fpPort1", "AdminState":"UP", "IpAddr":"10.1.1.2/24"}' 'http://localhost:8002/public/v1/config/IPv4Intf'
curl -sX POST -d '{"Name":"Loopback1"}' 'http://localhost:8002/public/v1/config/LogicalIntf'
curl -sX POST -d '{"IntfRef":"Loopback1", "AdminState":"UP", "IpAddr":"10.0.0.2/32"}' 'http://localhost:8002/public/v1/config/IPv4Intf'

# configure L3 interfaces on leaf3
curl -sX PATCH -d '{"IntfRef":"fpPort1", "AdminState":"UP"}' 'http://localhost:8003/public/v1/config/Port'
curl -sX POST -d '{"IntfRef":"fpPort1", "AdminState":"UP", "IpAddr":"10.1.1.3/24"}' 'http://localhost:8003/public/v1/config/IPv4Intf'
curl -sX POST -d '{"Name":"Loopback1"}' 'http://localhost:8003/public/v1/config/LogicalIntf'
curl -sX POST -d '{"IntfRef":"Loopback1", "AdminState":"UP", "IpAddr":"10.0.0.3/32"}' 'http://localhost:8003/public/v1/config/IPv4Intf'
