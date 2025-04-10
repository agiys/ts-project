-- Создание таблицы контейнеров
CREATE TABLE Containers (
    ID UNIQUEIDENTIFIER PRIMARY KEY,
    Number INT,
    Type NVARCHAR(255),
    Length FLOAT,
    Width FLOAT,
    Height FLOAT,
    Weight FLOAT,
    IsEmpty BIT,
    ArrivalDate DATETIME
);

-- Создание таблицы операций
CREATE TABLE Operations (
    ID UNIQUEIDENTIFIER PRIMARY KEY,
    ContainerID UNIQUEIDENTIFIER,
    StartDate DATETIME,
    EndDate DATETIME,
    OperationType NVARCHAR(255),
    OperatorName NVARCHAR(255),
    InspectionPlace NVARCHAR(255),
    FOREIGN KEY (ContainerID) REFERENCES Containers(ID)
);

-- Запрос, выбирающий все данные по контейнерам в формате JSON
SELECT
    '{' +
    '"ID": "' + CAST(ID AS NVARCHAR) + '", ' +
    '"Number": ' + CAST(Number AS NVARCHAR) + ', ' +
    '"Type": "' + Type + '", ' +
    '"Length": ' + CAST(Length AS NVARCHAR) + ', ' +
    '"Width": ' + CAST(Width AS NVARCHAR) + ', ' +
    '"Height": ' + CAST(Height AS NVARCHAR) + ', ' +
    '"Weight": ' + CAST(Weight AS NVARCHAR) + ', ' +
    '"IsEmpty": ' + CAST(IsEmpty AS NVARCHAR) + ', ' +
    '"ArrivalDate": "' + CONVERT(NVARCHAR, ArrivalDate, 126) + '"' +
    '}' AS ContainerJSON
FROM Containers;

-- Запрос, выбирающий все данные по операциям для НЕ пустых контейнеров в формате JSON (без JSON функций)
SELECT
    '{' +
    '"ID": "' + CAST(o.ID AS NVARCHAR) + '", ' +
    '"ContainerID": "' + CAST(o.ContainerID AS NVARCHAR) + '", ' +
    '"StartDate": "' + CONVERT(NVARCHAR, o.StartDate, 126) + '", ' +
    '"EndDate": "' + CONVERT(NVARCHAR, o.EndDate, 126) + '", ' +
    '"OperationType": "' + o.OperationType + '", ' +
    '"OperatorName": "' + o.OperatorName + '", ' +
    '"InspectionPlace": "' + o.InspectionPlace + '"' +
    '}' AS OperationJSON
FROM Operations o
JOIN Containers c ON o.ContainerID = c.ID
WHERE c.IsEmpty = 0;
