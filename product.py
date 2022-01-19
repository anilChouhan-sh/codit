import json
class Product :

    @staticmethod
    def toJson(products):
        data = []
        ids = {}
        
        for id, price ,name ,category in products:
            if id not in ids:
                ids[id] = {}
                ids[id]['category'] = [] 
            ids[id]['id'] = id
            ids[id]['price'] = price
            ids[id]['name'] = name
            ids[id]['category'].append(category)

            # data.append(ids)
        
        for d in ids.values():
            data.append(d)

        return json.dumps(data , indent =4 )
