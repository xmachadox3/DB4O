package com.conexion;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.config.EmbeddedConfiguration;

public class BDOO {
	private static BDOO INSTANCE = null;
	private final String PATH = "/home/machado/db.db4o"; 
	private static ObjectContainer db;
	
	private BDOO(){}
	private synchronized static void crearInstancia(){
		if(INSTANCE == null){
			INSTANCE = new BDOO();
			INSTANCE.performConnection();
		}
	}
	public void performConnection(){
		EmbeddedConfiguration configuracion = Db4oEmbedded.newConfiguration();
		db = Db4oEmbedded.openFile(configuracion,PATH);
	}
	public static ObjectContainer obtenerInstancia(){
		if(INSTANCE == null)
			crearInstancia();
		return db;
	}
	public static void cerrarBD(){
		try{
			db.close();
		}
		catch(Exception e){
			System.out.println("Error al cerrar la BD");
		}
	}
	
}
