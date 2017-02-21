package paypal.dto.analyze;

public class AnalyzeCondition {
	private String group;
	private String gender;
	private String[] age;
	private int ageLength;
	private String[] area;
	private int areaLength;
	private String period;
	private String periodFrom;
	private String periodTo;
	private String treeNodeName;
	private String treeNodeDepth;
	private String xAxisLabel;
	private String ageAllClicked;
	private String areaAllClicked;
	
	public String getGroup() {
		return group;
	}
	public void setGroup(String group) {
		this.group = group;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String[] getAge() {
		return age;
	}
	public void setAge(String[] age) {
		this.ageLength = age.length;
		this.age = age;
	}
	public String[] getArea() {
		return area;
	}
	public void setArea(String[] area) {
		this.areaLength = area.length;
		this.area = area;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getPeriodFrom() {
		System.out.println("periodFrom : " + this.periodFrom);
		return periodFrom;
	}
	public void setPeriodFrom(String periodFrom) {
		this.periodFrom = periodFrom.replaceAll("-", ",");
	}
	public String getPeriodTo() {
		System.out.println("periodTo : " + this.periodTo);
		return periodTo;
	}
	public void setPeriodTo(String periodTo) {
		this.periodTo = periodTo.replaceAll("-", ",");
	}
	public String getTreeNodeName() {
		return treeNodeName;
	}
	public void setTreeNodeName(String treeNodeName) {
		this.treeNodeName = treeNodeName;
	}
	public String getTreeNodeDepth() {
		return treeNodeDepth;
	}
	public void setTreeNodeDepth(String treeNodeDepth) {
		this.treeNodeDepth = treeNodeDepth;
	}
	public String getxAxisLabel() {
		return xAxisLabel;
	}
	public void setxAxisLabel(String xAxisLabel) {
		this.xAxisLabel = xAxisLabel;
	}
	public String getAgeAllClicked() {
		return ageAllClicked;
	}
	public void setAgeAllClicked(String ageAllClicked) {
		this.ageAllClicked = ageAllClicked;
	}
	public String getAreaAllClicked() {
		return areaAllClicked;
	}
	public void setAreaAllClicked(String areaAllClicked) {
		this.areaAllClicked = areaAllClicked;
	}
	public int getAgeLength() {
		return this.ageLength;
	}
	public void setAgeLength() {
		this.ageLength = this.age.length;
	}
	public int getAreaLength() {
		return this.areaLength;
	}
	public void setAreaLength() {
		this.areaLength = this.area.length;
	}
}
