package de.yetanothercalendar.model.view;

import org.jdom.Element;

public abstract class ViewHelper {

	protected Element element;

	/**
	 * Gibt das generierte Element zur�ck.
	 * 
	 * @return Element
	 */
	public Element getElement() {
		return element;
	}

}