
#size = "Standard_D4s_v3"

$resourcegroupname = "resourcegroup1"
$vmname = "vm1"
$vmsize = "Standard_D8s_v3"

# Get VM Size
Get-AzVMSize -ResourceGroupName $resourceGroupname -VMName $vmName

# Deallocate VM
stop-azvm -ResourceGroupName $resourcegroupname -name $vmname -force

# Resize VM
$vm = Get-AzVM -ResourceGroupName $resourceGroupname -VMName $vmName
$vm.HardwareProfile.VmSize = $vmsize
Update-AzVM -VM $vm -ResourceGroupName $resourceGroupname

# Start $VM
start-azvm -ResourceGroupName $resourcegroupname -name $vmname