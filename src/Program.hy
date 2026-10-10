public class Program {
    public static void Main(string[] args) {
        System.Australis.Terminal.Write("user> ");
        System.Australis.Terminal.ReadLine(64);
        System.Australis.Terminal.Write("input: ");
        System.Australis.Terminal.WriteResult();
        System.Australis.Terminal.WriteLine("");

        System.Australis.Files.Open("/hello.txt");
        System.Australis.Files.Read(1024);
        System.Australis.Terminal.Write("file: ");
        System.Australis.Terminal.WriteResult();
        System.Australis.Files.Close();
    }
}
