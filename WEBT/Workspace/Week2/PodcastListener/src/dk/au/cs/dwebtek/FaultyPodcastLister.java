package dk.au.cs.dwebtek;

import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.Namespace;
import org.jdom2.input.SAXBuilder;

/**
 * This program prints the titles and durations of all episodes of Troldspejlet
 * that are available as a podcast at dr.dk.
 * 
 * The program contains a bug that prevents it from running normally. Identify
 * the bug with the debugger and fix the program.
 * 
 * @author schwarz
 *
 */
public class FaultyPodcastLister {
	public static void main(String[] args) throws JDOMException, IOException {
		// Create the XML data URL for "Troldspejlet". Open the URL in a browser
		// to see the document...
		URL troldspejlet = new URL(
				"http://vpodcast.dr.dk/feeds/troldspejletrss.xml");
		// Open the connection to the URL
		URLConnection troldspejletConnection = troldspejlet.openConnection();
		InputStream troldspejletInputStream = troldspejletConnection
				.getInputStream();

		// Read the XML
		SAXBuilder builder = new SAXBuilder();
		Document troldspejletDocument = builder.build(troldspejletInputStream);

		// Get the 'item' elements under 'channel' as a list
		List<Element> items = troldspejletDocument.getRootElement()
				.getChild("channel").getChildren("item");
		
		//Add to find the namespace of iTunes
		Namespace itunes = Namespace.getNamespace("http://www.itunes.com/dtds/podcast-1.0.dtd");
		
		for (Element item : items) {
			// Print the text of the 'title' element for each 'item'
			Element title = item.getChild("title");
			System.out.print(title.getText() + ": ");

			// Print the text of the 'duration' element for this 'item' too
			Element duration = item.getChild("duration", itunes);
			System.out.println(duration.getText());
		}
	}
}
