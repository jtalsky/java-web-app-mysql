import java.io.File;
import java.util.Scanner;

public class Methods
{
    //Create Method without returning any value (without object)
    public static void getRequirements()
    {
        //display operational messages
        System.out.println("Developer: Jake H. Talsky");
        System.out.println("Program lists files and subdirectories of user-specified directory.");

        System.out.println(); //prints blank line
    }

    public static void directoryInfo()
    {
        //initialize variables
        String myDir = "";
        Scanner sc = new Scanner(System.in);

        //Demo user-entered directory path (note: escaped backslash!):
        //C:\tomcat\webapps\lis4368\skillsets
        //or:
        //C:/tomcat/webapps/lis4368/skillsets

        System.out.print("Please enter directory path: ");
        myDir = sc.nextLine(); //read line of user input

        //create File object for user-specified directory
        //File directoryPath = new File("C:\tomcat\webapps\lis4368\skillsets"); //hard-coded value
        File directoryPath = new File(myDir);

        System.out.println("------------------------------------");

        //Version 2: Better! try-catch block handles exceptions!
        try
        {
            //display file and directory names within specified directory
            File[] files = directoryPath.listFiles();

            //display file info
            for (int i = 0; i < files.length; i++)
            {
                System.out.println("Name: " + files[i].getName());
                System.out.println("Path: " + files[i].getAbsolutePath());
                System.out.println("Size (Bytes): " + files[i].length());
                System.out.println("Size (KB): " + files[i].length() / 1024);
                System.out.println("Size (MB): " + files[i].length() / (1024 * 1024));
                System.out.println();
            }
        }
        catch (Exception e)
        {
            System.err.println(e.getMessage());
        }

        sc.close(); //close scanner
    }
}