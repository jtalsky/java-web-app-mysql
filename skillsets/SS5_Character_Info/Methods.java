import java.util.Scanner;

public class Methods
{
    //Create Method without returning any value (without object)
    public static void getRequirements()
    {
        System.out.println("Developer: Jake H. Talsky");
        System.out.println("Program determines total number of characters in line of text,\nas well as number of times specific character is used.");
        System.out.println("Program displays character\'s ASCII value.");

        System.out.println("\nReferences:\n"
                        + "ASCII Background: https://en.wikipedia.org/wiki/ASCII\n"
                        + "ASCII Character Table: https://www.ascii-code.com/\n"
                        + "Lookup Tables: https://www.lookuptables.com/");

        System.out.println(); //print blank line
    }

    public static void characterInfo()
    {
        //initialize variables
        String str = "";
        char ch = ' '; //unlike empty string must include character -- here, space character!
        int len = 0;
        int num = 0;
        Scanner sc = new Scanner(System.in);

        //Demo text: This is some text for testing purposes!
        System.out.print("Please enter line of text: ");
        str = sc.nextLine(); // read line of user input
        len = str.length();

        System.out.print("Please enter character to check: ");
        //next() function returns next token
        //Token: smallest element of a program meaningful to compiler/interpreter
        //Generally, identifiers, keywords, literals, operators, and punctuations
        //Note: White space and comments not tokens -- though, separate tokens
        //Example: "I like this" ("I" is 1st token, "like" is second token, and "this" is third token)

        //chain intrinsic (aka built-in) methods:
        //captures first character from user-entered token
        ch = sc.next().charAt(0);

        for (int i = 0; i < len; i++)
        {
            if (ch == str.charAt(i))
            {
                ++num;
            }
        }

        System.out.println("\nNumber of characters in line of text: " + len);
        System.out.println("The character " + ch + " appears " + num + " time(s) in line of text.");
        System.out.println("ASCII value: " + (int) ch); //cast char to int

        sc.close(); //close scanner
    }
}