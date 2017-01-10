# Realm-KeyValue

This script (Swift 3) will allow you to use Realm database to save Key\Value pairs

## Usage

The script uses the default configuration of realm. To change the target realm (unnecessary if you use the default realm):
```
KeyValue.realm = Realm(CustomRealmConfiguration)
```

### Set a new key

The key must be a string, the value can be a string, int, float, double, bool, or a date. If the key already exists, its value will be updated
```
KeyValue.setString(key: "String Key", value: "Value1")
KeyValue.setInt(key: "Integer Key", value: 42)
KeyValue.setBool(key: "Boolean Key", value: true)
KeyValue.setDate(key: "Date Key", value: Date())
```

### Get value of a key
```
KeyValue.getString(key: "String Key")
KeyValue.getInt(key: "Integer Key")
// ......
```
return nil if the key is not found

### Check if a key exists
```
KeyValue.keyExists(key: "Bool Key")
```

### Delete a key
```
KeyValue.getObject(key: "Date Key").delete()
```
