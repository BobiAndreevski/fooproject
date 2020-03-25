import org.junit.Test;
import static org.junit.Assert.*;

public class FiboTest{
  @Test
public void testFib(){
  Fibo test = new Fibo();
  assertEquals(0,test.fib(0));
  assertEquals(1,test.fib(1));
  assertEquals(1,test.fib(2));
  assertEquals(2,test.fib(3));
  assertEquals(3,test.fib(4));
  assertEquals(5,test.fib(5));
  assertEquals(8,test.fib(6));
  assertEquals(13,test.fib(7));
  assertEquals(21,test.fib(8));
  assertEquals(34,test.fib(9));
  assertEquals(55,test.fib(10));
}
}
