package xmlValidator;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.JDOMException;
import org.jdom2.input.JDOMParseException;
import org.jdom2.input.SAXBuilder;
import org.jdom2.input.sax.XMLReaderJDOMFactory;
import org.jdom2.input.sax.XMLReaderXSDFactory;

public class Validator {
	static File xml = new File("../GifToXML.xml");
	public static void main(String[] args) 
	{
		// File initialization
		String xmlFile = null;
		String schemaFile = null;
		
		try 
		{
			CheckArgs(args);
			
			xmlFile = args[0];
			schemaFile = args[1];		
		} 
		catch (FileNotFoundException e) 
		{
			System.out.println("You fuck up!");
			e.printStackTrace();
			System.exit(1);
		}
		
		try {
			XMLReaderJDOMFactory factory = new XMLReaderXSDFactory(new File(schemaFile));
			SAXBuilder sb = new SAXBuilder(factory);
			Document doc = sb.build(xmlFile);
			
			System.out.println("Validated!");
		}
		
		//Error handling
		catch (JDOMParseException e) //Bad parsing in file 
		{
			System.out.println("Something is wrong in the XML file!");
			System.out.println(e.getMessage());
		} 
		catch (JDOMException e) //Correct file?
		{
			System.out.println("Can't read the file.");
			e.printStackTrace();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}
	}
	
	static void CheckArgs(String[] args) throws FileNotFoundException
	{
		if( args.length == 0)
			System.out.println("No input arguments!");
		
		if(args.length == 1)
			System.out.println("No second argument!");
		
		File file = new File(args[0]);
		if(!file.exists())
			throw new FileNotFoundException("First file not found");
		
		file = new File(args[1]);
		if(!file.exists())
			throw new FileNotFoundException("Second file not found");
	}
}
