#include "arcodelistener/detect_object.h"

DetectObject::DetectObject()
{
}

DetectObject::DetectObject(string id,objectType type,float x,float y,float z,float time,sqlite3 *db)
{

    this->type = type;
    this->location.x = x;
    this->location.y = y;
    this->location.z = z;
    this->time = time;
    this->db = db;
    map<string,string> LocationMap;
    map<string,string> ObjectMap;
    ObjectMap.insert(pair<string,string> ("be4814630fa4e7a722eecd7f1c000ae3","可乐"));
    LocationMap.insert(pair<string,string>("0","厕所"));
    LocationMap.insert(pair<string,string>("1","办公室"));
    if(this->type==ArCode)
    {
        this->name=LocationMap[id];
    }
    else if(this->type==RegnizedObj)
    {
        this->name=ObjectMap[id];
    }
    else
    {
        this->name="Other Type";
    }
    cout<<"name is :"<<this->name<<endl;
}
DetectObject::DetectObject(string name,int typenum,sqlite3 *db)
{
    this->name = name;
    this->location.x=0;
    this->location.y=0;
    this->location.z=0;
    this->typenum = typenum;
    this->db   = db  ;
}

static int callback(void *location, int argc, char **argv, char **azColName){
    int i;
    char * xyz[]={"X","Y","Z"};
    for(i=0; i<argc; i++){
      printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
   }
    (*(Location*)location).x = atof(argv[2]);
    (*(Location*)location).y = atof(argv[3]);
    (*(Location*)location).z = atof(argv[4]);
    printf("\n");
    return 0;
}

bool DetectObject::Select()
{
    char *zErrMsg = 0;
    int rc;
    format fmt( "SELECT * FROM MYLIB WHERE TYPE = %1% AND NAME = '%2%';" );
    fmt % this->typenum;fmt % this->name;
    string str = fmt.str();
    cout<<str<<endl;
    const char *mysql = str.c_str();
    rc = sqlite3_exec(db, mysql, callback, (void*)&location, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "FindIfHadOne SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return false;
    }else{
        fprintf(stdout, "Operation done successfully\n");
        return true;
    }
}

bool DetectObject::CreateTable()
{
    char *zErrMsg = 0;
    char *sql;
    int  rc;
   /* Create SQL statement */
   sql = "CREATE TABLE MYLIB( "\
        "TYPE INT NOT NULL,"\
        "NAME TEXT NOT NULL,"\
        "X REAL NOT NULL,"\
        "Y REAL NOT NULL,"\
        "Z REAL NOT NULL,"\
        "TIME REAL );";
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
    fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return false;
    }else{
        fprintf(stdout, "Table created successfully\n");
        return true;
    }
}

bool DetectObject::DelectTable()
{
    char *zErrMsg = 0;
    char *sql;
    int  rc;
   /* Create SQL statement */
   sql = "DROP TABLE MYLIB;";
    rc = sqlite3_exec(db, sql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
    fprintf(stderr, "SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return false;
    }else{
        fprintf(stdout, "Delect Table successfully\n");
        return true;
    }
}


bool DetectObject::InsertOne()
{
    char *zErrMsg = 0;
    int rc;
    format fmt( "INSERT INTO MYLIB (TYPE,NAME,X,Y,Z,TIME) VALUES (%1%,'%2%',%3%,%4%,%5%,%6%);" );
    fmt % type;fmt % name;fmt % location.x ;fmt % location.y ;fmt % location.z ;fmt % time ;
    string str = fmt.str();
    cout<<"Insert Command is :"<<str<<endl;
    const char *mysql = str.c_str();
    rc = sqlite3_exec(db, mysql, callback, 0, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "InsertOne SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return false;
    }else{
        fprintf(stdout, "Insert data successfully\n");
        return true;
    }
}

static int Findcallback(void *exist, int argc, char **argv, char **azColName){
   int i;
   for(i=0; i<argc; i++){
      printf("%s = %s\n", azColName[i], argv[i] ? argv[i] : "NULL");
   }
   printf("\n");
   *(bool*)exist = true;//NB
   return 0;
}

bool DetectObject::FindIfHadOne()
{
    char *zErrMsg = 0;
    int rc;
    bool exist = false;
    format fmt( "SELECT * from MYLIB WHERE X BETWEEN %1% AND %2% AND Y BETWEEN %3% AND %4% AND Z BETWEEN %5% AND %6% AND TYPE = %7%;" );
    fmt % (location.x-threshold) ;fmt % (location.x+threshold) ;
    fmt % (location.y-threshold) ;fmt % (location.y+threshold) ;
    fmt % (location.z-threshold) ;fmt % (location.z+threshold) ;
    fmt % type;
    string str = fmt.str();
    const char *mysql = str.c_str();
    rc = sqlite3_exec(db, mysql, Findcallback, (void*)&exist, &zErrMsg);
    if( rc != SQLITE_OK ){
        fprintf(stderr, "FindIfHadOne SQL error: %s\n", zErrMsg);
        sqlite3_free(zErrMsg);
        return true;
    }else{
        fprintf(stdout, "Operation done successfully\n");
        return exist;
    }
}

DetectObject::~DetectObject()
{
}