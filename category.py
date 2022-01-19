
import json
class Category :
    @staticmethod
    def toJson(categories):
        data = []
        ids = {}

        for name , id , child_id in categories:
            if id not in ids:
                ids[id] = {}
                ids[id]['child'] = []
            
            ids[id]['name'] = name
            ids[id]['id'] = id
            ids[id]['child'].append(child_id)

         

        for d in ids.values():
            children = []
            for c in d['child']:
                if c is not None :
                    children.append(ids[c]['name'])
            d['child'] =children
            data.append(d)

        return json.dumps(data , indent = 4)