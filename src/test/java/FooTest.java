import static org.junit.jupiter.api.Assertions.assertEquals;

class FooTest {
// kollar om detta funkar
    @org.junit.jupiter.api.Test
    void myMethod() {
        assertEquals(true, Foo.myMethod());
    }
}
