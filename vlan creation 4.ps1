D2: vlan creation + dhcp + svi:
config t 
vlan 20
 name vlan20.com.ph
 exit
Int vlan 20
 no shut
 ip add 10.0.32.1 255.255.224.0
 ip ospf 1 area 0
ip dhcp excluded-add 10.0.32.1 10.0.32.150
ip dhcp pool vlan20.com.ph   
 network 10.0.32.0 255.255.224.0
 default-router 10.0.32.0
 domain-name vlan20.com.ph
 @D2:
 conf t
 Int e 1/0
  switchport mode access
  switchport access vlan 20
  @S2:
  conf t
  Int e 1/0
  no shut
  ip address dhcp
