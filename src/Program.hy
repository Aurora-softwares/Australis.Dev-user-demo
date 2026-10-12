public class Program {
    public static int Main(string[] args) {
        System.Console.Write("user> ");
        string input = System.Console.ReadLine();
        System.Console.Write("input: ");
        System.Console.WriteLine(input);

        if (!System.IO.File.Exists("/hello.txt")) { return 1; }
        string contents = System.IO.File.ReadAllText("/hello.txt");
        System.Console.Write("file: ");
        System.Console.Write(contents);
        return 0;
    }
}
