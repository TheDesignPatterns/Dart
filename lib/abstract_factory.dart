abstract class AbstractProductA {
	void operation();
}

class ProductA1 implements AbstractProductA {
	@override
	void operation() => print(this);
}

class ProductA2 implements AbstractProductA {
	@override
	void operation() => print(this);
}

abstract class AbstractProductB {
	void operation();
}

class ProductB1 implements AbstractProductB {
	@override
	void operation() => print(this);
}

class ProductB2 implements AbstractProductB {
	@override
	void operation() => print(this);
}

abstract class AbstractFactory {
	AbstractProductA createProductA();
	AbstractProductB createProductB();
}

class Factory1 implements AbstractFactory {
	@override
	AbstractProductA createProductA() => ProductA1();
	@override
	AbstractProductB createProductB() => ProductB1();
}

class Factory2 implements AbstractFactory {
	@override
	AbstractProductA createProductA() => ProductA2();
	@override
	AbstractProductB createProductB() => ProductB2();
}
