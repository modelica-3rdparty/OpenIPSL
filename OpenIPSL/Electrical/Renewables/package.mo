within OpenIPSL.Electrical;
package Renewables "Models that can be used to represent wind, solar, and battery storage energy sources"

annotation (Documentation(info="<html>
<p>This package contains models that can be used to create renewable energy sources, such as Photovoltaic, Wind, and Battery Energy Storage Systems.
 The models implemented are found in standard power system dynamic tools, such as Siemens PTI PSS®E, PowerWorld, General Electric PSLF,
 and are based on the Western Electricity Coordinating Council (WECC) renewable energy guidelines. It is worth mentioning that the components implemented
in this package are based on the second generation renewable energy models.</p>
<p>The package contains a subpackage called PSS®E, from where four different subpackages contains the components for different parts of the renewable sources.</p>
<p>The modelling of such devices is based, mainly, on the following references:</p>
<ul>
<li><em>Siemens PTI, PSS®E 34.2.0 model library</em>, by Siemens Power Technologies International, Schenectady, NY (2017),</li>
<li><em>WECC Solar Photovoltaic Power Plant Modeling and Validation Guideline</em>, by WECC Renewable Energy Modeling Task Force,</li>
<li><em>WECC Wind Power Plant Dynamic Modeling Guide</em>, by WECC Renewable Energy Modeling Task Force, and</li>
<li><em>WECC Battery Storage Dynamic Modeling Guideline</em>, by WECC Renewable Energy Modeling Task Force.</li>
</ul>
</html>"));
end Renewables;
