<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="Proyecto_Modulo_Transporte.Azure" generation="1" functional="0" release="0" Id="db75ebd2-a66e-4464-bafd-fb488cfb97ee" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="Proyecto_Modulo_Transporte.AzureGroup" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="Proyecto_Modulo_Transporte:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/LB:Proyecto_Modulo_Transporte:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="Proyecto_Modulo_Transporte:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="">
          <maps>
            <mapMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/MapProyecto_Modulo_Transporte:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </maps>
        </aCS>
        <aCS name="Proyecto_Modulo_TransporteInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/MapProyecto_Modulo_TransporteInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:Proyecto_Modulo_Transporte:Endpoint1">
          <toPorts>
            <inPortMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_Transporte/Endpoint1" />
          </toPorts>
        </lBChannel>
      </channels>
      <maps>
        <map name="MapProyecto_Modulo_Transporte:Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" kind="Identity">
          <setting>
            <aCSMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_Transporte/Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" />
          </setting>
        </map>
        <map name="MapProyecto_Modulo_TransporteInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_TransporteInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="Proyecto_Modulo_Transporte" generation="1" functional="0" release="0" software="C:\Users\JoseClavijo\source\repos\Proyecto_Modulo_Transporte\Proyecto_Modulo_Transporte.Azure\csx\Debug\roles\Proyecto_Modulo_Transporte" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
            </componentports>
            <settings>
              <aCS name="Microsoft.WindowsAzure.Plugins.Diagnostics.ConnectionString" defaultValue="" />
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;Proyecto_Modulo_Transporte&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;Proyecto_Modulo_Transporte&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_TransporteInstances" />
            <sCSPolicyUpdateDomainMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_TransporteUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_TransporteFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="Proyecto_Modulo_TransporteUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="Proyecto_Modulo_TransporteFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="Proyecto_Modulo_TransporteInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="1cfb760f-6217-4174-ab96-3ddd095813bb" ref="Microsoft.RedDog.Contract\ServiceContract\Proyecto_Modulo_Transporte.AzureContract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="3c9dfcf7-0478-448b-96e7-6685ec69f708" ref="Microsoft.RedDog.Contract\Interface\Proyecto_Modulo_Transporte:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/Proyecto_Modulo_Transporte.Azure/Proyecto_Modulo_Transporte.AzureGroup/Proyecto_Modulo_Transporte:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>