within OpenIPSL.Electrical.Sources.SourceBehindImpedance.VoltageSources;
model VSource "Generic voltage source behind an internal impedance"
  extends BaseClasses.baseVoltageSource;
equation
   // Internal voltage source equations
   E = E0 "Model assumes constant voltage magnitude, therefore this E0 is constant";
   delta = delta0 "Model assumes constant voltage angle, therefore delta0 is constant";
   Er = Er0 "Real part is constant as per model assumptions";
   Ei = Ei0 "Imaginary part is constant as per model assumptions";
  annotation (Icon(graphics={
        Ellipse(extent={{-100,100},{100,-100}},
                                           lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid),
        Ellipse(
          extent={{4,40},{84,-40}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.None,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Ellipse(
          extent={{-76,-40},{4,40}},
          lineColor={28,108,200},
          lineThickness=1,
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          startAngle=0,
          endAngle=180,
          closure=EllipseClosure.None),
        Text(
          extent={{-100,140},{100,100}},
          textColor={0,0,0},
          textString="%name")}), Documentation(info="<html>
<p>
This model provides a voltage source with an internal (constant) voltage source and internal impedance. 

The internal voltage source magnitude and angle are calculated based on the impedance and power flow data. 

It is based on [Du2021], with the difference that the internal impedance includes a resistance and not only a reactance. 
</p>

<p>
[Du2021] W. Du, Y. Liu, F.K. Tuffner, R. Huang and Z. Huang: &quot;Model Specification of Droop-Controlled Grid-Forming Inverters (REGFM_A1)&quot;, Richland, WA, USA: Pacific Northwest National Laboratory, September 2021. <a href=\"https://www.pnnl.gov/main/publications/external/technical_reports/PNNL-32278.pdf\">document</a> 
</p>

</html>"));
end VSource;
