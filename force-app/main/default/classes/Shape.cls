public abstract class Shape {
    public Integer numberOfSides { get; set; }
    public String color { get; set; }
    
    // Abstract methods must be implemented by subclasses
    public abstract Decimal calculateArea();
    public abstract Decimal calculatePerimeter();
    
    // Non-abstract method with default implementation
    public void setColor(String c) {
        color = c;
        System.debug('Color set to: ' + color);
    }
}