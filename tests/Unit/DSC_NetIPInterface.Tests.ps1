$script:dscModuleName = 'NetworkingDsc'
$script:dscResourceName = 'DSC_NetIPInterface'

function Invoke-TestSetup
{
    try
    {
        Import-Module -Name DscResource.Test -Force -ErrorAction 'Stop'
    }
    catch [System.IO.FileNotFoundException]
    {
        throw 'DscResource.Test module dependency not found. Please run ".\build.ps1 -Tasks build" first.'
    }

    $script:testEnvironment = Initialize-TestEnvironment `
        -DSCModuleName $script:dscModuleName `
        -DSCResourceName $script:dscResourceName `
        -ResourceType 'Mof' `
        -TestType 'Unit'

    Import-Module -Name (Join-Path -Path $PSScriptRoot -ChildPath '..\TestHelpers\CommonTestHelper.psm1')
}

function Invoke-TestCleanup
{
    Restore-TestEnvironment -TestEnvironment $script:testEnvironment
}

Invoke-TestSetup

# Begin Testing
try
{
    InModuleScope $script:dscResourceName {
        <#
            This is an array of parameters that will be used with pester test cases
            to test each individual parameter. The array contains a hash table
            representing each paramter to test. The properties of the hash table are
            - Name: the name of the parameter.
            - MockedValue: The value that the mock for Get-NetIPInterface will return for
              the parameter
            - TestValue: The value that will be used to change the setting to.
            - ParameterFilter: The parameter filter condition used to determine if the
              value has been successfully set in Set-TargetResource.
        #>
        $testParameterList = @(
            @{
                Name            = 'AdvertiseDefaultRoute'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.AdvertiseDefaultRoute]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $AdvertiseDefaultRoute -eq 'Disabled'
                }
            },
            @{
                Name            = 'Advertising'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.Advertising]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $Advertising -eq 'Disabled'
                }
            },
            @{
                Name            = 'AutomaticMetric'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.AutomaticMetric]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $AutomaticMetric -eq 'Disabled'
                }
            },
            @{
                Name            = 'Dhcp'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.Dhcp]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $Dhcp -eq 'Disabled'
                }
            },
            @{
                Name            = 'DirectedMacWolPattern'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.DirectedMacWolPattern]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $DirectedMacWolPattern -eq 'Disabled'
                }
            },
            @{
                Name            = 'EcnMarking'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.EcnMarking]::AppDecide
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $EcnMarking -eq 'Disabled'
                }
            },
            @{
                Name            = 'ForceArpNdWolPattern'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.ForceArpNdWolPattern]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $ForceArpNdWolPattern -eq 'Disabled'
                }
            },
            @{
                Name            = 'Forwarding'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.Forwarding]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $Forwarding -eq 'Disabled'
                }
            },
            @{
                Name            = 'IgnoreDefaultRoutes'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.IgnoreDefaultRoutes]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $IgnoreDefaultRoutes -eq 'Disabled'
                }
            },
            @{
                Name            = 'ManagedAddressConfiguration'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.ManagedAddressConfiguration]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $ManagedAddressConfiguration -eq 'Disabled'
                }
            },
            @{
                Name            = 'NeighborUnreachabilityDetection'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.NeighborUnreachabilityDetection]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $NeighborUnreachabilityDetection -eq 'Disabled'
                }
            },
            @{
                Name            = 'OtherStatefulConfiguration'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.OtherStatefulConfiguration]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $OtherStatefulConfiguration -eq 'Disabled'
                }
            },
            @{
                Name            = 'RouterDiscovery'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.RouterDiscovery]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $RouterDiscovery -eq 'Disabled'
                }
            },
            @{
                Name            = 'WeakHostReceive'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.WeakHostReceive]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $WeakHostReceive -eq 'Disabled'
                }
            },
            @{
                Name            = 'WeakHostSend'
                MockedValue     = [Microsoft.PowerShell.Cmdletization.GeneratedTypes.NetIPInterface.WeakHostSend]::Enabled
                TestValue       = 'Disabled'
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $WeakHostSend -eq 'Disabled'
                }
            },
            @{
                Name            = 'NlMtu'
                MockedValue     = [System.Uint32] 1600
                TestValue       = [System.Uint32] 1500
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $NlMtuBytes -eq 1500
                }
            },
            @{
                Name            = 'InterfaceMetric'
                MockedValue     = [System.Uint32] 20
                TestValue       = [System.Uint32] 15
                ParameterFilter = {
                    $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4' -and $InterfaceMetric -eq 15
                }
            }
        )

        $script:netIPInterfaceExists = @{
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
            Verbose        = $true
        }

        $script:netIPInterfaceExists_ParameterFilter = {
            $InterfaceAlias -eq 'Ethernet' -and $AddressFamily -eq 'IPv4'
        }

        $script:netIPInterfaceExists_Settings = @{
            InterfaceAlias = 'Ethernet'
            AddressFamily  = 'IPv4'
        }

        foreach ($parameter in $testParameterList)
        {
            $null = $script:netIPInterfaceExists_Settings.Add($parameter.Name, $parameter.MockedValue)
        }

        $script:netIPInterfaceMissing = @{
            InterfaceAlias = 'EthernetDoesNotExist'
            AddressFamily  = 'IPv4'
            Verbose        = $true
        }

        $script:netIPInterfaceMissing_ParameterFilter = {
            $InterfaceAlias -eq 'EthernetDoesNotExist' -and $AddressFamily -eq 'IPv4'
        }

        Describe 'DSC_NetIPInterface\Get-TargetResource' -Tag 'Get' {
            Context 'When called with alias and address family of an existing interface' {
                Mock `
                    -CommandName Get-NetworkIPInterface `
                    -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                    -MockWith { $script:netIPInterfaceExists_Settings }

                It 'Should not throw an exception' {
                    {
                        $script:result = Get-TargetResource @script:netIPInterfaceExists
                    } | Should -Not -Throw
                }

                It 'Should return <MockedValue> for parameter <Name>' -TestCases $testParameterList {
                    param
                    (
                        $Name, $MockedValue, $TestValue, $ParameterFilter
                    )

                    $script:result[$Name] | Should -Be $MockedValue
                }
            }
        }

        Describe 'DSC_NetIPInterface\Test-TargetResource' -Tag 'Test' {
            Context 'When called with alias and address family of an existing interface and a mismatching value' {
                Mock `
                    -CommandName Get-NetworkIPInterface `
                    -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                    -MockWith { $script:netIPInterfaceExists_Settings }

                It 'Should return $false when existing value for parameter <Name> is set to <TestValue> but should be <MockedValue>' -TestCases $testParameterList {
                    param
                    (
                        $Name, $MockedValue, $TestValue, $ParameterFilter
                    )

                    $comparisonParameter = @{
                        $Name = $TestValue
                    }

                    $script:result = Test-TargetResource @script:netIPInterfaceExists @comparisonParameter

                    $script:result | Should -BeFalse
                }
            }

            Context 'When called with alias and address family of an existing interface and no mismatching values' {
                Mock `
                    -CommandName Get-NetworkIPInterface `
                    -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                    -MockWith { $script:netIPInterfaceExists_Settings }

                It 'Should return $true when existing value for parameter <Name> is set to <TestValue> and should be <TestValue>' -TestCases $testParameterList {
                    param
                    (
                        $Name, $MockedValue, $TestValue, $ParameterFilter
                    )

                    $comparisonParameter = @{
                        $Name = $MockedValue
                    }

                    $script:result = Test-TargetResource @script:netIPInterfaceExists @comparisonParameter

                    $script:result | Should -BeTrue
                }
            }
        }

        Describe 'DSC_NetIPInterface\Set-TargetResource' -Tag 'Set' {
            Context 'When called with alias and address family of an existing interface and a mismatching value' {
                Mock `
                    -CommandName Get-NetworkIPInterface `
                    -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                    -MockWith { $script:netIPInterfaceExists_Settings }

                It 'Should set parameter <Name> to <TestValue>' -TestCases $testParameterList {
                    param
                    (
                        $Name, $MockedValue, $TestValue, $ParameterFilter
                    )

                    $comparisonParameter = @{
                        $Name = $TestValue
                    }

                    Mock `
                        -CommandName Set-NetIPInterface

                    Set-TargetResource @script:netIPInterfaceExists @comparisonParameter

                    Assert-MockCalled `
                        -CommandName Set-NetIPInterface `
                        -ParameterFilter $ParameterFilter `
                        -Exactly -Times 1
                }
            }

            Context 'When called with alias and address family of an existing interface and no mismatching values' {
                Mock `
                    -CommandName Get-NetworkIPInterface `
                    -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                    -MockWith { $script:netIPInterfaceExists_Settings }

                It 'Should not call Set-NetIPInterface' {
                    $comparisonParameter = @{
                        $testParameterList[0].Name = $testParameterList[0].MockedValue
                    }

                    Mock `
                        -CommandName Set-NetIPInterface

                    Set-TargetResource @script:netIPInterfaceExists @comparisonParameter

                    Assert-MockCalled `
                        -CommandName Set-NetIPInterface `
                        -ParameterFilter $ParameterFilter `
                        -Exactly -Times 0
                }
            }
        }

        Describe 'DSC_NetIPInterface\Get-NetworkIPInterface' {
            Context 'When called with alias and address family of an interface that does not exist' {
                Mock `
                    -CommandName Get-NetIPInterface `
                    -ParameterFilter $script:netIPInterfaceMissing_ParameterFilter

                It 'Should throw expected exception' {
                    $errorRecord = Get-InvalidOperationRecord `
                        -Message ($script:localizedData.NetworkIPInterfaceDoesNotExistMessage -f $script:netIPInterfaceMissing.InterfaceAlias, $script:netIPInterfaceMissing.AddressFamily)

                    {
                        $script:result = Get-NetworkIPInterface @script:netIPInterfaceMissing
                    } | Should -Throw $errorRecord
                }

                It 'Should call the expected mocks' {
                    Assert-MockCalled `
                        -CommandName Get-NetIPInterface `
                        -ParameterFilter $script:netIPInterfaceMissing_ParameterFilter `
                        -Exactly -Times 1
                }
            }

            Context 'When called with alias and address family of an existing interface' {
                Mock `
                    -CommandName Get-NetIPInterface `
                    -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                    -MockWith { $script:netIPInterfaceExists_Settings }

                It 'Should not throw exception' {
                    {
                        $script:result = Get-NetworkIPInterface @script:netIPInterfaceExists
                    } | Should -Not -Throw
                }

                It 'Should call the expected mocks' {
                    Assert-MockCalled `
                        -CommandName Get-NetIPInterface `
                        -ParameterFilter $script:netIPInterfaceExists_ParameterFilter `
                        -Exactly -Times 1
                }
            }
        }
    }
}
finally
{
    Invoke-TestCleanup
}
