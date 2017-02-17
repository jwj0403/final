package paypal.dto.analyze;

import java.util.List;

public class ProductNode {
	private String id;
	private int nodeDepth;
	private int depth;
	private String nodeName;
	private String name;
	private List<ProductNode> children;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getNodeDepth() {
		return nodeDepth;
	}
	public void setNodeDepth(int nodeDepth) {
		this.depth = nodeDepth;
		this.nodeDepth = nodeDepth;
	}
	public int getDepth() {
		return this.depth;
	}
	public String getNodeName() {
		return nodeName;
	}
	public void setNodeName(String nodeName) {
		this.name = nodeName;
		this.nodeName = nodeName;
	}
	public List<ProductNode> getChildren() {
		return children;
	}
	public void setChildren(List<ProductNode> children) {
		this.children = children;
	}
	public String getName() {
		return this.name;
	}
}
