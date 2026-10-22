public class Circle extends Shape {
    public Decimal radius { get; set; }
    
    public Circle(Decimal r) {
        this.radius = r;
        // numberOfSides property is inherited from the abstract class
        this.numberOfSides = 0; 
    }
    
    // Implementation for the abstract calculateArea method
    public override Decimal calculateArea() {
        // Area of a circle: PI * r^2
        return Math.PI * (this.radius * this.radius);
    }
    
    // Implementation for the abstract calculatePerimeter method
    public override Decimal calculatePerimeter() {
        // Perimeter (Circumference) of a circle: 2 * PI * r
        return 2 * Math.PI * this.radius;
    }
}