package FlowExample
  model VelocityField
    outer Real R;
    parameter Real Cylinder_Radius = 1.0;
    Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(height = 1, length = 10*Cylinder_Radius, lengthDirection = {0, 0, -1}, shapeType = "cylinder", width = Cylinder_Radius) annotation(
      Placement(visible = true, transformation(origin = {-4, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    R = Cylinder_Radius;
    annotation(
      Icon(graphics = {Line(origin = {2, -21.81}, points = {{-92, 6.90962}, {-92, 6.90962}, {-22, 6.90962}, {-2, -7.09038}, {18, 6.90962}, {92, 6.90962}, {92, 6.90962}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.02, -21.9}, points = {{-93, -8.95596}, {-41, -8.95596}, {-1, -26.956}, {39, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {-0.542945, 59.7301}, points = {{-91, 0}, {91, 0}, {95, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-2.13804, -55.5613}, points = {{-91, 0}, {91, 0}, {95, 0}}, color = {0, 170, 255}, thickness = 1), Ellipse(fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}), Line(origin = {-0.542945, 59.7301}, points = {{-91, 0}, {91, 0}, {91, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {1, 38.96}, points = {{-93, -8.95596}, {-41, -8.95596}, {-1, 9.04404}, {39, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.03, 20.6}, points = {{-94, -8.92059}, {-28, -8.92059}, {-2, 9.07941}, {26, -8.92059}, {94, -8.92059}, {94, -8.92059}, {94, -8.92059}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier)}));
  end VelocityField;

  model Flow
    //
    outer Real R;
    parameter Real U = 1.0;
    parameter Real x_init = -3.0;
    parameter Real y_init = 0.5;
    //
    Real V_r;
    Real V_theta;
    Real r(start = x_init*cos(atan(y_init/x_init)));
    Real theta(start = atan(y_init/x_init));
    Real x;
    Real y;
    //
    Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(color = {0, 0, 255}, height = 0.1, length = 0.1, r = {x, y, 0}, shapeType = "sphere", width = 0.1) annotation(
      Placement(visible = true, transformation(origin = {0, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    V_r = U*(1 - R^2/r^2)*cos(theta);
    der(r) = V_r;
  //
    V_theta = -U*(1 + R^2/r^2)*sin(theta);
    der(theta) = V_theta/r;
  //
    x = r*cos(theta);
    y = r*sin(theta);
  //
    annotation(
      Icon(graphics = {Line(origin = {65.6243, 34.8784}, points = {{14, 5}, {-14, -5}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-0.675673, 46.0384}, points = {{-79.697, -6.15653}, {80.303, -6.15653}, {52.303, 5.84347}}, color = {0, 170, 255}, thickness = 1), Line(origin = {66.3756, -4.94278}, points = {{14, 5}, {-14, -5}}, color = {0, 170, 255}, thickness = 1), Line(origin = {0.0756743, 6.21722}, points = {{-79.697, -6.15653}, {80.303, -6.15653}, {52.303, 5.84347}}, color = {0, 170, 255}, thickness = 1), Line(origin = {65.2486, -45.1397}, points = {{14, 5}, {-14, -5}}, color = {0, 170, 255}, thickness = 1), Line(origin = {65.6243, 34.8784}, points = {{14, 5}, {-14, -5}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-0.675673, 46.0384}, points = {{-79.697, -6.15653}, {80.303, -6.15653}, {52.303, 5.84347}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-0.299997, -33.6039}, points = {{-79.697, -6.15653}, {80.303, -6.15653}, {52.303, 5.84347}}, color = {0, 170, 255}, thickness = 1)}),
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002));
  end Flow;

  model FlowAroundCylinder
    inner Real R;
    FlowExample.VelocityField velocityField annotation(
      Placement(visible = true, transformation(origin = {-1.77636e-14, 1.77636e-14}, extent = {{-94, -94}, {94, 94}}, rotation = 0)));
    FlowExample.Flow flow1(U = 1, y_init = 0.01) annotation(
      Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow2(U = 1, y_init = 0.05) annotation(
      Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow3(U = 1, y_init = 0.1) annotation(
      Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow4(U = 1, y_init = 0.15) annotation(
      Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow5(U = 1, y_init = -0.1) annotation(
      Placement(visible = true, transformation(origin = {-70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow6(U = 1, y_init = -0.05) annotation(
      Placement(visible = true, transformation(origin = {-70, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow7(U = 1, y_init = -0.15) annotation(
      Placement(visible = true, transformation(origin = {-70, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    FlowExample.Flow flow8(U = 1, y_init = -0.01) annotation(
      Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation

    annotation(
      Icon(graphics = {Line(origin = {1, 38.96}, points = {{-93, -8.95596}, {-41, -8.95596}, {-1, 9.04404}, {39, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {2, -21.81}, points = {{-92, 6.90962}, {-92, 6.90962}, {-22, 6.90962}, {-2, -7.09038}, {18, 6.90962}, {92, 6.90962}, {92, 6.90962}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Ellipse(fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}), Line(origin = {-0.542945, 59.7301}, points = {{-91, 0}, {91, 0}, {95, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-0.542945, 59.7301}, points = {{-91, 0}, {91, 0}, {91, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {1.03, 20.6}, points = {{-94, -8.92059}, {-28, -8.92059}, {-2, 9.07941}, {26, -8.92059}, {94, -8.92059}, {94, -8.92059}, {94, -8.92059}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.02, -21.9}, points = {{-93, -8.95596}, {-41, -8.95596}, {-1, -26.956}, {39, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {-2.13804, -55.5613}, points = {{-91, 0}, {91, 0}, {95, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-70.9069, 45.4705}, points = {{-20.1708, 0}, {19.8292, 0}, {7.82918, -6}, {7.82918, 6}, {19.8292, 0}}, thickness = 1), Line(origin = {-71.2826, 19.9249}, points = {{-20.1708, 0}, {19.8292, 0}, {7.82918, -6}, {7.82918, 6}, {19.8292, 0}}, thickness = 1), Line(origin = {-70.5313, -22.9016}, points = {{-20.1708, 0}, {19.8292, 0}, {7.82918, -6}, {7.82918, 6}, {19.8292, 0}}, thickness = 1), Line(origin = {-70.9069, -45.0662}, points = {{-20.1708, 0}, {19.8292, 0}, {7.82918, -6}, {7.82918, 6}, {19.8292, 0}}, thickness = 1)}),
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.002));
  end FlowAroundCylinder;
  annotation(
    Icon(graphics = {Ellipse(fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-20, 20}, {20, -20}}), Line(origin = {1.03, 20.6}, points = {{-94, -8.92059}, {-28, -8.92059}, {-2, 9.07941}, {26, -8.92059}, {94, -8.92059}, {94, -8.92059}, {94, -8.92059}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {2, -21.81}, points = {{-92, 6.90962}, {-92, 6.90962}, {-22, 6.90962}, {-2, -7.09038}, {18, 6.90962}, {92, 6.90962}, {92, 6.90962}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1, 38.96}, points = {{-93, -8.95596}, {-41, -8.95596}, {-1, 9.04404}, {39, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {1.02, -21.9}, points = {{-93, -8.95596}, {-41, -8.95596}, {-1, -26.956}, {39, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}, {93, -8.95596}}, color = {0, 170, 255}, thickness = 1, smooth = Smooth.Bezier), Line(origin = {-0.542945, 59.7301}, points = {{-91, 0}, {91, 0}, {91, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-0.542945, 59.7301}, points = {{-91, 0}, {91, 0}, {95, 0}}, color = {0, 170, 255}, thickness = 1), Line(origin = {-2.13804, -55.5613}, points = {{-91, 0}, {91, 0}, {95, 0}}, color = {0, 170, 255}, thickness = 1)}),
    uses(Modelica(version = "4.0.0")));
end FlowExample;
