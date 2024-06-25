import 'package:path/path.dart';
import 'package:sqfliatividade/model/classes/tarefa.dart';
import 'package:sqfliatividade/model/classes/usuario.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static const int _version = 1;
  static const String _dbName = "TaskDataBase.db";

//criando arquivo .db e implementando tabela de tarefa e usuario
  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      version: _version,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE usuario (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            nome TEXT,
            email TEXT,
            senha TEXT
          );
        ''');

        await db.execute('''
          CREATE TABLE tarefa (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            titulo TEXT,
            descricao TEXT,
            dataHora TEXT,
            finalizada INTEGER,
            idUsuario INTEGER,
            FOREIGN KEY (idUsuario) REFERENCES usuario (id)
          );
        ''');
        await _insertDefaultUser(db);
      },
    );
  }

  static Future<void> _insertDefaultUser(Database db) async {
    //TODO: Detalhes do usuário padrão
    Map<String, dynamic> user = {
      'nome': 'admin',
      'email': 'admin',
      'senha': 'admin',
    };

    await db.insert('usuario', user);
  }

//TODO:CRUD de tarefa
  static Future<int> insertTarefa(Tarefa tarefa) async {
    final db = await _getDB();
    return await db.insert('tarefa', tarefa.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateTarefa(Tarefa tarefa) async {
    final db = await _getDB();
    return await db.update('tarefa', tarefa.toJson(),
        where: 'id = ?',
        whereArgs: [tarefa.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> deleteTarefa(Tarefa tarefa) async {
    final db = await _getDB();
    return await db.delete(
      'tarefa',
      where: 'id = ?',
      whereArgs: [tarefa.id],
    );
  }

  static Future<List<Tarefa>> getAllTarefas() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('tarefa');
    if (maps.isEmpty) return List.empty();

    return List.generate(maps.length, (index) => Tarefa.fromJson(maps[index]));
  }

  static Future<List<Tarefa>> getTarefasUsuario(Usuario usuario) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db
        .query('tarefa', where: 'idUsuario = ?', whereArgs: [usuario.id]);
    if (maps.isEmpty) return List.empty();
    return List.generate(maps.length, (index) => Tarefa.fromJson(maps[index]));
  }

  static Future<Tarefa> getTarefasUsuarioById(Usuario usuario, int id) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('tarefa',
        where: 'idUsuario = ? AND id = ?', whereArgs: [usuario.id, id]);
    if (maps.isEmpty) {
      return const Tarefa(
          idUsuario: 0,
          titulo: 'N/A',
          descricao: 'N/A',
          dataHora: 'N/A',
          finalizada: 0);
    }

    return Tarefa.fromJson(maps.first);
  }

//TODO:CRUD de usuario
  static Future<int> insertUsuario(Usuario usuario) async {
    final db = await _getDB();
    return await db.insert('usuario', usuario.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<int> updateUsuario(Usuario usuario) async {
    final db = await _getDB();
    return await db.update('usuario', usuario.toJson(),
        where: 'id = ?',
        whereArgs: [usuario.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<List<Usuario>> getAllUsuarios() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query('usuario');
    if (maps.isEmpty) return List.empty();

    return List.generate(maps.length, (index) => Usuario.fromJson(maps[index]));
  }

  static Future<Usuario?> getUsuarioByEmail(String email) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'usuario',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isEmpty) {
      return null;
    }
    return Usuario.fromJson(maps.first);
  }

  static Future<int> deleteUsuario(Usuario usuario) async {
    final db = await _getDB();
    return await db.delete(
      'usuario',
      where: 'id = ?',
      whereArgs: [usuario.id],
    );
  }

//TODO:confirmação de login
  static Future<Usuario?> login(String email, String senha) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query(
      'usuario',
      where: 'email = ? AND senha = ?',
      whereArgs: [email, senha],
    );
    if (maps.isEmpty) return null;
    return Usuario.fromJson(maps.first);
  }
}
