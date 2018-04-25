using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.Services;

[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
public class MyClosetAPI : System.Web.Services.WebService{

        #region ######################################################################################################################################################## Wrapper Methods [DON'T MODIFY]

        // Database
        private void addParam(string name, object value) { Helper.addParam(name, value); }
        private DataSet sqlExecDataSet(string sql) { return Helper.sqlExecDataSet(sql); }
        private DataTable sqlExecDataTable(string sql) { return Helper.sqlExecDataTable(sql); }
        private DataTable sqlExec(string sql) { return Helper.sqlExec(sql); }
        private DataTable sqlExec(string sql, DataTable dt, string udtblParam) { return Helper.sqlExec(sql, dt, udtblParam); }
        private DataTable sqlExecQuery(string sql) { return Helper.sqlExecQuery(sql); }

        // Serializer
        private void streamJson(string jsonString) { Helper.streamJson(jsonString); }
        private void serialize(Object obj) { Helper.serialize(obj); }
        private void serializeSingleDataTableRow(DataTable dt) { Helper.serializeSingleDataTableRow(dt); }
        private void serializeDataTable(DataTable dt) { Helper.serializeDataTable(dt); }
        private void serializeDataSet(DataSet ds) { Helper.serializeDataSet(ds); }
        private void serializeXML<T>(T value) { Helper.serializeXML(value); }
        private void serializeDictionary(Dictionary<object, object> dic) { Helper.serializeDictionary(dic); }
        private void serializeObject(Object obj) { Helper.serializeObject(obj); }

    // Going to leave this out so we don't need to import Newtonsoft.Json package
    //private T _download_serialized_json_data<T>(string url) where T : new()	{	return Helper._download_serialized_json_data<T>(url);	}

    #endregion

    //=== Web Service Methods Follow Below
    [WebMethod(Description = "Gets a set number of clothing items to populate the front page")]
    public void getClothingItems(int count, string filter)
    {
        filter = filter.Trim();
        addParam("@filter", filter);
        addParam("@count", count);
        serializeDataTable(sqlExec("spGetCustomersByFilter"));
    }

}