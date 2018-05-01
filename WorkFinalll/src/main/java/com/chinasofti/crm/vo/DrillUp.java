package com.chinasofti.crm.vo;

/**
 * Created by fzm on 2017/8/11.
 */
public class DrillUp {
    private String name;
    private double y;
    private String drilldown;
    public DrillUp() {
    }

    public DrillUp(String name, double y, String drilldown) {
        this.name = name;
        this.y = y;
        this.drilldown = drilldown;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }

    public String getDrilldown() {
        return drilldown;
    }

    public void setDrilldown(String drilldown) {
        this.drilldown = drilldown;
    }

    @Override
    public String toString() {
        return "{" +
                "name='" + name + '\'' +
                ", y=" + y +
                ", drilldown='" + drilldown + '\'' +
                '}';
    }
}
