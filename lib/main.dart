import 'package:flutter/material.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Do List Activity App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF7E57C2),
        scaffoldBackgroundColor: const Color(0xFFF8F7FA),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> _activities = [];
  final TextEditingController _controller = TextEditingController();

  // Fungsi menambahkan kegiatan
  void _showAddDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text(
          "Tambah Kegiatan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: TextField(
          controller: _controller,
          decoration: const InputDecoration(
            hintText: "Contoh: Belajar Flutter",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.task_alt),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              _controller.clear();
              Navigator.pop(context);
            },
            child: const Text("Batal"), 
          ),
          ElevatedButton.icon(
            icon: const Icon(Icons.save),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                setState(() {
                  _activities.add(_controller.text);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('"${_controller.text}" ditambahkan! ✅'),
                    duration: const Duration(seconds: 2),
                    backgroundColor: Colors.deepPurple,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                _controller.clear();
                Navigator.pop(context);
              }
            },
            label: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  // Fungsi menghapus kegiatan
  void _deleteActivity(int index) {
    String deleted = _activities[index];
    setState(() {
      _activities.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('"$deleted" telah dihapus 🗑️'),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Gradient AppBar
      appBar: AppBar(
        toolbarHeight: 75,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF7E57C2), Color(0xFF512DA8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          "📝 To-Do Activity App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
      ),

      // Body
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: _activities.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "✨ Belum ada kegiatan hari ini ✨",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text("Tekan tombol + untuk menambah kegiatan",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 16),
                    Text("🗓️", style: TextStyle(fontSize: 40)),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: _activities.length,
                itemBuilder: (context, index) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    curve: Curves.easeInOut,
                    child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shadowColor: Colors.deepPurple.withOpacity(0.3),
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 6),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepPurple.shade100,
                          child: const Icon(Icons.check, color: Colors.purple),
                        ),
                        title: Text(
                          _activities[index],
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_forever,
                              color: Colors.redAccent),
                          onPressed: () => _deleteActivity(index),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),

      // Floating Button Tambah
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF7E57C2),
        onPressed: _showAddDialog,
        icon: const Icon(Icons.add_task, color: Colors.white),
        label: const Text(
          "Tambah",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
