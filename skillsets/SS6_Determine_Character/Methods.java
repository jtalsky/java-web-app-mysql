import java.util.Scanner;

public class Methods
{
    public static void getRequirements()
    {
        //display operational messages
        System.out.println("Developer: Jake H. Talsky");
        System.out.println("Program determines whether user-entered value is vowel, consonant, special character, or integer.");
        System.out.println("Program displays character\'s ASCII value.");

        System.out.println("\nReferences:\n"
                        + "ASCII Background: https://en.wikipedia.org/wiki/ASCII\n"
                        + "ASCII Character Table: https://www.ascii-code.com/\n"
                        + "Lookup Tables: https://www.lookuptables.com/");

        System.out.println(); //print blank line
    }

    public static void determineChar()
    {
        //initialize variables
        char ch = ' '; //unlike empty string *must* include character--here, space character!
        char chTest = ' '; //ch cast to lower-case
        Scanner sc = new Scanner(System.in);

        System.out.print("Please enter character: ");
        //next() function returns next token
        //Token: smallest element of a program meaningful to compiler/interpreter
        //Generally, identifiers, keywords, literals, operators, and punctuations
        //Note: White space and comments not tokens--though, separate tokens
        //Example: "I like this" ("I" is 1st token, "like" is second token, and "this" is third token)
        ch = sc.next().charAt(0); //capture first character from first token
        chTest = Character.toLowerCase(ch);

        //Note: Can be resolved in different ways.
        //Here: Works with legacy Java, no need for special functions...
        //test for alpha characters
        if((chTest == 'a' || chTest == 'e' || chTest == 'i' || chTest == 'o' || chTest == 'u' || chTest == 'y'))
        {
            System.out.println(ch + " is vowel. ASCII value: " + (int) ch); //cast char to int
        }
        //test for numeric characters
        else if(ch >= '0' && ch <= '9')
        {
            System.out.println(ch + " is integer. ASCII value: " + (int) ch);
        }
        //test for consonants (note: vowels captured above)
        else if((ch >= 'A' && ch <= 'Z') || (ch >= 'a' && ch <= 'z'))
        {
            System.out.println(ch + " is consonant. ASCII value: " + (int) ch);
        }
        //otherwise, must be a special character
        else
        {
            System.out.println(ch + " is special character. ASCII value: " + (int) ch);
        }

        sc.close(); //close scanner
    }
}