import psycopg2 as lib


def command_1():
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  free_trucks_exists ();')
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_2():
    print("Введите id машины, которую хотите занять:")
    message_in = str(input())
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  truck_busy (%(id)s);', {"id": message_in})
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_3():
    print("Введите id машины, которую хотите освободить:")
    message_in = str(input())
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  truck_free (%(id)s);', {"id": message_in})
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_4():
    print("Введите id работника:")
    message_in1 = str(input())
    print("Введите дату")
    message_in2 = str(input())
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  work_date_exist (%(id)s, %(data)s);', {"id": message_in1, "data": message_in2})
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_5():
    print("Введите id работника:")
    message_in = str(input())
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  work_exist (%(id)s);', {"id": message_in})
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_6():
    print("Введите id объекта:")
    message_in = str(input())
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  view_object (%(id)s);', {"id": message_in})
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_7():
    print("Введите id объекта:")
    message_in = str(input())
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  view_object_link (%(id)s);', {"id": message_in})
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


def command_8():
    database = lib.connect(dbname="postgres", user="postgres", password="123g321j", host="127.0.0.1", port="5433")
    cursor = database.cursor()
    cursor.execute('SELECT *  FROM  view_object_all ();')
    for row in cursor:
        print(row)
    database.commit()
    cursor.close()
    if database is not None:
        database.close()


if __name__ == "__main__":
    print("Список команд:")
    print("1 - free_trucks_exists () - посмотреть, есть ли свободные машины")
    print("2 - truck_busy (id_in) - забрать грузовик с заданным id")
    print("3 - truck_free (id_in) - освободить грузовик с заданным id")
    print("4 - work_date_exist (id_in, date_in) - узнать, есть ли у данного работника в данный день какая-то работа")
    print("5 - work_exist (id_in) - узнать, есть ли у данного работника какая-то работа")
    print("6 - view_object (id_in) - посмотреть на объект с заданным id")
    print("7 - view_object_link () - посмотреть на объект с заданным id из таблицы связи")
    print("8 - view_object_all () - посмотреть на все объекты")
    print("9 - выход")

    while (True):
        print("\nВведите нужную вам команду:")
        message = str(input())
        if message == '1':
            command_1()
        elif message == '2':
            command_2()
        elif message == '3':
            command_3()
        elif message == '4':
            command_4()
        elif message == '5':
            command_5()
        elif message == '6':
            command_6()
        elif message == '7':
            command_7()
        elif message == '8':
            command_8()
        elif message == '9':
            break


