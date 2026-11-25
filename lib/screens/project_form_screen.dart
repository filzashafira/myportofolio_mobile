import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/models/project.dart';
import 'package:myportofolio_mobile/services/api_client.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';
import 'package:myportofolio_mobile/widgets/left_drawer.dart';
import 'package:provider/provider.dart';

class ProjectFormScreen extends StatefulWidget {
  const ProjectFormScreen({super.key});

  @override
  State<ProjectFormScreen> createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends State<ProjectFormScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _techStack = '';
  String _projectUrl = '';
  String _projectImageUrl = '';
  bool _isSubmitting = false;

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (!await ensureLoggedIn(context)) return;
    if (!mounted) return;

    final token = context.read<AuthState>().token;
    if (token == null) return;

    setState(() {
      _isSubmitting = true;
    });

    final newProject = Project(
      title: _title,
      description: _description,
      techStack: _techStack,
      projectUrl: _projectUrl,
      projectImageUrl: _projectImageUrl,
    );

    try {
      await context.read<ApiClient>().createProject(newProject, token: token);
      if (!mounted) return;

      await showDialog<void>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Project Saved'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Title: $_title'),
                Text('Tech Stack: $_techStack'),
                Text('Project URL: $_projectUrl'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
      if (!mounted) return;
      Navigator.pop(context);
    } on ApiException catch (e) {
      if (!mounted) return;
      if (e.statusCode == 401) {
        await context.read<AuthState>().logout();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Session expired (401). Please login again.'),
          ),
        );
        await ensureLoggedIn(context);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create project (HTTP ${e.statusCode})'),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isSubmitting = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Achievement: Project')),
      drawer: const LeftDrawer(),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Project Title',
                  labelText: 'Title',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) => _title = value,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Title cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Project Description',
                  labelText: 'Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) => _description = value,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Description cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'e.g. Flutter, Django, PostgreSQL',
                  labelText: 'Tech Stack',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) => _techStack = value,
                validator: (value) => (value == null || value.isEmpty)
                    ? 'Tech Stack cannot be empty!'
                    : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'https://github.com/username/repo',
                  labelText: 'Project URL',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) => _projectUrl = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Project URL cannot be empty!';
                  }
                  final uri = Uri.tryParse(value);
                  if (uri == null || !uri.hasScheme || !uri.hasAuthority) {
                    return 'Please enter a valid URL (e.g. https://...)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'https://example.com/image.png (Optional)',
                  labelText: 'Project Image URL (Optional)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onChanged: (value) => _projectImageUrl = value,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                onPressed: _isSubmitting ? null : _submit,
                child: _isSubmitting
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
