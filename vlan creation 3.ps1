D1: vlan creation + dhcp + svi:
config t 
vlan 101
 name vlan101.com.ph
 exit
Int vlan 101
 no shut
 ip add 10.0.4.1 255.255.252.0
 ip ospf 1 area 0
ip dhcp excluded-add 10.0.4.1 10.0.4.100
ip dhcp pool vlan101.com.ph   
 network 10.0.4.0 255.255.252.0
 default-router 10.0.4.0
 domain-name vlan101.com.ph
 @A2:
 conf t
 Int e 1/0
  switchport mode access
  switchport access vlan 101
  @S1:
  conf t
  Int e 1/0
  no shut
  ip address dhcp
