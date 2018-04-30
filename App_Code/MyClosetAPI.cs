﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class MyClosetAPI : System.Web.Services.WebService{

    #region ######################################################################################################################################################## Wrapper Methods [DON'T MODIFY]
        Helper helper = new Helper();
        // Database
        private void addParam(string name, object value) { helper.addParam(name, value); }
        private DataSet sqlExecDataSet(string sql) { return helper.sqlExecDataSet(sql); }
        private DataTable sqlExecDataTable(string sql) { return helper.sqlExecDataTable(sql); }
        private DataTable sqlExec(string sql) { return helper.sqlExec(sql); }
        private DataTable sqlExec(string sql, DataTable dt, string udtblParam) { return helper.sqlExec(sql, dt, udtblParam); }
        private DataTable sqlExecQuery(string sql) { return helper.sqlExecQuery(sql); }

        // Serializer
        private void streamJson(string jsonString) { helper.streamJson(jsonString); }
        private void serialize(Object obj) { helper.serialize(obj); }
        private void serializeSingleDataTableRow(DataTable dt) { helper.serializeSingleDataTableRow(dt); }
        private void serializeDataTable(DataTable dt) { helper.serializeDataTable(dt); }
        private void serializeDataSet(DataSet ds) { helper.serializeDataSet(ds); }
        private void serializeXML<T>(T value) { helper.serializeXML(value); }
        private void serializeDictionary(Dictionary<object, object> dic) { helper.serializeDictionary(dic); }
        private void serializeObject(Object obj) { helper.serializeObject(obj); }

    // Going to leave this out so we don't need to import Newtonsoft.Json package
    //private T _download_serialized_json_data<T>(string url) where T : new()	{	return Helper._download_serialized_json_data<T>(url);	}

    #endregion

    //=== Web Service Methods Follow Below
    [WebMethod(Description = "Add a user to the database")]
    public void addUser(string Fname, string Lname, string phone, string email, string username, string password)
    {
        addParam("@Fname", Fname);
        addParam("@Lname", Lname);
        addParam("@PhoneNumber", phone);
        addParam("@Email", email);
        addParam("@Username", username);
        addParam("@Password", password);
        serializeDataTable(sqlExec("spAddUser"));
    }

    [WebMethod(Description = "Add a clothing item to the database")]
    public void addClothingItem(int subcat, int userid, string name, string description, string color, string size, string condition, string picture)
    {
        addParam("@SubCatID", subcat);
        addParam("@UserID", userid);
        addParam("@Name", name);
        addParam("@Description", description);
        addParam("@Color", color);
        addParam("@Size", size);
        addParam("@Condition", condition);
        addParam("@Picture", picture);
        serializeDataTable(sqlExec("spAddClothingItem"));
    }

    [WebMethod(Description = "Get the userid from the username and password")]
    public void getUserID(string username)
    {
        addParam("@Username", username);
        serializeDataTable(sqlExec("spGetUserID"));
    }

    [WebMethod(Description = "Get the clothing items from the db")]
    public void getClothingItems()
    {
        serializeDataTable(sqlExec("spGetAllClothing"));
    }

    [WebMethod(Description = "Get the user clothing items from the db")]
    public void getUserClothingItems(int userid)
    {
        addParam("@UserID", userid);
        serializeDataTable(sqlExec("spGetUserClothing"));
    }

    [WebMethod(Description = "Get the user favorite clothing items from db")]
    public void getUserFavorites(int userid)
    {
        addParam("@UserID", userid);
        serializeDataTable(sqlExec("spGetUserFavoritedClothing"));
    }

}