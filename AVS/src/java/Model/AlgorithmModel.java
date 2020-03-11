/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import DBContext.DBContext;
import Entity.Algorithm;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Jisoo
 */
public class AlgorithmModel {

    private final DBContext db;

    public AlgorithmModel() throws Exception {
        db = new DBContext();
    }
    //new function cua quang

    public ArrayList<Algorithm> getAlgosortbyID() throws SQLException, Exception {
        ArrayList<Algorithm> listAllAlgorithms = new ArrayList<>();
        DBContext dbManager = new DBContext();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = dbManager.getConnection();
            String sql = "SELECT * FROM Algorithm WHERE algo_CompareStatus = 1 ORDER BY algo_ID";
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int algoid = rs.getInt(1);
                String algoname = rs.getString(2);
                String algocodejava = rs.getString(3);
                String algocodecplus = rs.getString(4);
                String algocodejs = rs.getString(5);
                String algodescription = rs.getString(6);
                int categoryid = rs.getInt(7);
                String algodatetime = rs.getString(9);
                String algoresource = rs.getString(9);
                int number_of_step = 0;
                listAllAlgorithms.add(new Algorithm(algoid, algoname, algocodejava, algocodecplus, algocodejs, algodescription, categoryid, algodatetime, algoresource, number_of_step));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            new CloseConnection().close(connection, statement, rs);
        }
        return listAllAlgorithms;
    }

    public ArrayList<Algorithm> getAlgoNameAndCategory() throws SQLException, Exception {
        ArrayList<Algorithm> listAllAlgorithms = new ArrayList<>();
        DBContext dbManager = new DBContext();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = dbManager.getConnection();
            String sql = "SELECT [algo_ID],[algo_Name],[algo_CodeJS],[category_Name] "
                    + "FROM Algorithm INNER JOIN Category "
                    + "ON Category.category_ID = Algorithm.category_ID "
                    + "ORDER BY Algorithm.category_ID;";

            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                Algorithm algorithm = new Algorithm();
                algorithm.setAlgoID(rs.getInt("algo_ID"));
                algorithm.setAlgoName(rs.getString("algo_Name"));
                algorithm.setAlgoCodeJS(rs.getString("algo_CodeJS"));
                algorithm.setCategoryName(rs.getString("category_Name"));
                listAllAlgorithms.add(algorithm);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            new CloseConnection().close(connection, statement, rs);
        }
        return listAllAlgorithms;
    }

    public ArrayList<Algorithm> getAlgoIDList() throws SQLException, Exception {
        ArrayList<Algorithm> algos = new ArrayList<>();
        DBContext dbManager = new DBContext();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = dbManager.getConnection();
            statement = connection.prepareStatement("Select * from Algorithm");
            rs = statement.executeQuery();
            while (rs.next()) {
                Algorithm algo = new Algorithm();
                algo.setAlgoID(rs.getInt("algo_ID"));
                algos.add(algo);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            new CloseConnection().close(connection, statement, rs);
        }
        return algos;
    }

    public ArrayList<Algorithm> getAlgoByID(int ID) throws SQLException, Exception {
        ArrayList<Algorithm> algos = new ArrayList<Algorithm>();
        DBContext dbManager = new DBContext();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = dbManager.getConnection();
            statement
                    = connection.prepareStatement("SELECT * from Algorithm where algo_ID = ?;");
            statement.setInt(1, ID);
            rs = statement.executeQuery();
            while (rs.next()) {
                Algorithm algo = new Algorithm();
                algo.setAlgoID(rs.getInt("algo_ID"));
                algo.setAlgoName(rs.getString("algo_Name"));
                algo.setAlgoCodeJS(rs.getString("algo_CodeJS"));
                algo.setAlgoCodeCplus(rs.getString("algo_CodeCplus"));
                algo.setAlgoCodeJava(rs.getString("algo_CodeJava"));
                algo.setAlgoDescription(rs.getString("algo_Description"));
                algo.setCategoryID(rs.getInt("category_ID"));
                algo.setAlgoFile(rs.getString("algo_Files"));
                algos.add(algo);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            new CloseConnection().close(connection, statement, rs);
        }

        return algos;
    }

    public ArrayList<Algorithm> getAlgoByCategory(int categoryID) throws SQLException, Exception {
        ArrayList<Algorithm> algos = new ArrayList<Algorithm>();
        DBContext dbManager = new DBContext();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        try {
            connection = dbManager.getConnection();
            statement
                    = connection.prepareStatement("SELECT * from Algorithm "
                            + "WHERE category_ID = ? AND algo_CompareStatus = 1 "
                            + "ORDER BY algo_ID;");
            statement.setInt(1, categoryID);
            rs = statement.executeQuery();
            while (rs.next()) {
                Algorithm algo = new Algorithm();
                algo.setAlgoID(rs.getInt("algo_ID"));
                algo.setAlgoName(rs.getString("algo_Name"));
                algo.setCategoryID(rs.getInt("category_ID"));
                algos.add(algo);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            new CloseConnection().close(connection, statement, rs);
        }
        return algos;
    }
    
}
