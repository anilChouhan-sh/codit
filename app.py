from flask_mysqldb import MySQL
from flask import Flask, request, jsonify
from product import Product
from category import Category
app = Flask(__name__)

app.config['MYSQL_HOST'] = "172.28.156.205" 
app.config['MYSQL_USER'] = "yog"
app.config['MYSQL_PASSWORD'] = "hello"
app.config['MYSQL_DB'] = "cod"

mysql = MySQL(app)

def query(q , value=None):
    connection = mysql.connection
    cur = connection.cursor()
    cur.execute(q , value )
    count = cur.rowcount
    a = cur.fetchall()
    connection.commit() 
    cur.close()
    
    return a ,count


@app.route('/<int:id>')
def entry(id):
    
    # print(a)
    return str(id)

# api for product crud---->>>
@app.route('/product/create' , methods=['POST'])
def createProduct():
    form = request.form
    name = form.get('name')
    price = form.get('price')
    data ,count = query('insert into product(price , product_name) values(%s , %s)' , [price ,name])
    id , count = query('select max(product_id) from product')
    categories = form.get('categories')
    print(type(categories) , categories)
    data ,count = query('select category_id from category where category_name IN {}'.format(categories))
    c = 0
    for category_id in data:
        da , count = query('insert into product_category values(%s ,%s)' , [id , category_id[0]])
        c+=count
    return str(data)



@app.route('/product' , methods=['GET'])
def prod():
    if request.method == 'GET' :
        data  ,count= query("SELECT p.product_id , price , product_name , category_name FROM product p JOIN product_category pc ON p.product_id = pc.product_id JOIN category c ON pc.category_id = c.category_id")
        data = Product.toJson(data)
        print(data)
        return (data , 200)


@app.route('/product/<int:id>/update' , methods=['POST'])
def updateProduct(id):
    newprice = request.form.get('newprice')
    newname = request.form.get('newname')
    if newprice  is not None :
        data ,count =  query('UPDATE product SET price = %s WHERE product_id = %s' , [newprice , id])
    if newname  is not None :
        data ,count =  query('UPDATE product SET product_name = %s WHERE product_id = %s' , [str(newname) , id])
    return (str(count))


@app.route('/product/<int:id>/delete' , methods=['POST'])
def deleteProduct(id):
    data ,count = query('Delete from product where product_id = %s' , [id])
    return str(count)


# api for category --->>>>

@app.route('/category' , methods = ['GET'])
def category():
    data, count = query('SELECT category_name , c.category_id, pc.child_id   FROM category c LEFT JOIN parent_category pc ON c.category_id = pc.parent_id')
    data = Category.toJson(data)
    return str(data)



    


if __name__ == "__main__" :
    app.run(debug=True)