SELECT SKU, SKU_Description FROM INVENTORY;
SELECT SKU_Description, SKU FROM INVENTORY;
SELECT warehouseID FROM INVENTORY;
SELECT DISTINCT WarehouseID FROM INVENTORY;
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY;
SELECT * FROM INVENTORY;
SELECT * FROM INVENTORY WHERE QuantityOnHand > 0;
SELECT SKU, SKU_Description FROM INVENTORY WHERE QuantityOnHand = 0;
SELECT SKU, SKU_Description, warehouseID FROM INVENTORY WHERE QuantityOnHand = 0 
ORDER BY warehouseID ASC;
SELECT SKU, SKU_Description, warehouseID FROM INVENTORY WHERE QuantityOnHand > 0
ORDER BY warehouseID DESC, SKU ASC;
SELECT SKU, SKU_Description, warehouseID FROM INVENTORY WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0
ORDER BY warehouseID DESC, SKU ASC;
SELECT SKU, SKU_Description, warehouseID FROM INVENTORY WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0
ORDER BY warehouseID DESC, SKU ASC;
SELECT SKU, SKU_Description, warehouseID FROM INVENTORY WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;
SELECT SKU, SKU_Description, warehouseID FROM INVENTORY WHERE QuantityOnHand BETWEEN 1 AND 10;
SELECT DISTINCT SKU, SKU_Description FROM INVENTORY;
SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE '%climb%';
SELECT DISTINCT SKU, SKU_Description FROM INVENTORY WHERE SKU_Description LIKE '__d%';
SELECT COUNT(QuantityOnHand) AS TotalRecords, SUM(QuantityOnHand) AS TotalQuantity, 
AVG(QuantityOnHand) AS AverageQuantity, 
MIN(QuantityOnHand) AS MinimumQuantity, 
MAX(QuantityOnHand) AS MaximumQuantity 
FROM inventory;