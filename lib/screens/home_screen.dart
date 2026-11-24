import 'package:flutter/material.dart';
import '../models/hub_links.dart';
import '../widgets/link_card.dart';

const hubAccent = Color(0xFF3458DB);
const hubInk = Color(0xFF182544);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final searchController = TextEditingController();
  String category = 'Todos';
  String query = '';

  String normalize(String value) {
    const accented = 'áàâãäéèêëíìîïóòôõöúùûüç';
    const plain = 'aaaaaeeeeiiiiooooouuuuc';
    var result = value.toLowerCase();
    for (var i = 0; i < accented.length; i++) {
      result = result.replaceAll(accented[i], plain[i]);
    }
    return result;
  }

  void resetFilters() {
    searchController.clear();
    setState(() {
      category = 'Todos';
      query = '';
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      'Todos',
      ...hubLinks.map((link) => link.category).toSet(),
    ];
    final visible = hubLinks
        .where(
          (link) =>
              (category == 'Todos' || link.category == category) &&
              normalize(
                '${link.title} ${link.description} ${link.category}',
              ).contains(normalize(query.trim())),
        )
        .toList();
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final wide = constraints.maxWidth >= 1000;
            final padding = wide ? 42.0 : 20.0;
            return Row(
              children: [
                if (wide)
                  Container(
                    width: 238,
                    decoration: const BoxDecoration(
                      color: Color(0xFF14213D),
                      border: Border(
                        right: BorderSide(color: Color(0xFFE5EAF0)),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 28, 18, 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const _Brand(inverse: true),
                          const SizedBox(height: 52),
                          const Text(
                            'ESPAÇO REDES',
                            style: TextStyle(
                              fontSize: 14,
                              letterSpacing: 1.2,
                              color: Color(0xFFA6B6D5),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Material(
                            color: const Color(0xFF24365B),
                            borderRadius: BorderRadius.circular(10),
                            child: ListTile(
                              leading: const Icon(
                                Icons.grid_view_rounded,
                                color: Color(0xFFB9CBFF),
                              ),
                              title: const Text(
                                'Visão geral',
                                style: TextStyle(
                                  color: Color(0xFFEDF2FF),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              onTap: resetFilters,
                            ),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: const Color(0xFF24365B),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Text(
                              'Plataformas, dados e materiais para conectar o cuidado em oncologia pediátrica.',
                              style: TextStyle(
                                fontSize: 14,
                                height: 1.5,
                                color: Color(0xFFC6D3F0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                Expanded(
                  child: CustomScrollView(
                    slivers: [
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(padding, 26, padding, 22),
                        sliver: SliverToBoxAdapter(
                          child: Row(
                            children: [
                              if (!wide)
                                const Expanded(flex: 4, child: _Brand())
                              else
                                const Text(
                                  'Hub Redes / Visão geral',
                                  style: TextStyle(
                                    color: Color(0xFF536170),
                                    fontSize: 14,
                                  ),
                                ),
                              const Spacer(),
                              const CircleAvatar(
                                backgroundColor: Color(0xFFE6EBFF),
                                child: Text(
                                  'PR',
                                  style: TextStyle(
                                    color: hubAccent,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.fromLTRB(padding, 0, padding, 28),
                        sliver: SliverToBoxAdapter(
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE9EEFF),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: const Color(0xFFD8E0FC),
                              ),
                            ),
                            child: Stack(
                              children: [
                                if (wide)
                                  const Positioned(
                                    right: -15,
                                    top: -25,
                                    bottom: -25,
                                    width: 340,
                                    child: CustomPaint(
                                      painter: _NetworkPainter(),
                                    ),
                                  ),
                                Padding(
                                  padding: EdgeInsets.all(wide ? 36 : 24),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'PROJETO REDES',
                                              style: TextStyle(
                                                color: hubAccent,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w800,
                                                letterSpacing: 2,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            Text(
                                              'Hub de acesso ao Drive do Projeto Redes',
                                              style: TextStyle(
                                                color: hubInk,
                                                fontSize: wide ? 38 : 28,
                                                fontWeight: FontWeight.w800,
                                                height: 1.15,
                                                letterSpacing: -1,
                                              ),
                                            ),
                                            const SizedBox(height: 16),
                                            const Text(
                                              'Use a busca ou os filtros por categoria para encontrar o que precisa. Clique em um cartão para abrir a pasta no Drive ou acessar a plataforma correspondente.',
                                              style: TextStyle(
                                                color: Color(0xFF445777),
                                                fontSize: 16,
                                                height: 1.5,
                                              ),
                                            ),
                                            const SizedBox(height: 22),
                                            Wrap(
                                              spacing: 16,
                                              runSpacing: 8,
                                              children: [
                                                _BannerLabel(
                                                  label:
                                                      '${hubLinks.length} recursos conectados',
                                                  icon: Icons.hub_outlined,
                                                ),
                                                const _BannerLabel(
                                                  label: 'Uma rede de cuidado',
                                                  icon: Icons
                                                      .diversity_1_outlined,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      if (wide) const SizedBox(width: 270),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SliverPadding(
                        padding: EdgeInsets.symmetric(horizontal: padding),
                        sliver: SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LayoutBuilder(
                                builder: (context, size) {
                                  final heading = Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Explore a rede',
                                        style: TextStyle(
                                          fontSize: 22,
                                          color: hubInk,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        '${visible.length} de ${hubLinks.length} recursos',
                                        style: const TextStyle(
                                          color: Color(0xFF536170),
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  );
                                  final search = SizedBox(
                                    width: size.maxWidth < 560
                                        ? double.infinity
                                        : 300,
                                    child: TextField(
                                      controller: searchController,
                                      onChanged: (value) =>
                                          setState(() => query = value),
                                      decoration: InputDecoration(
                                        hintText: 'Buscar recurso',
                                        prefixIcon: const Icon(
                                          Icons.search_rounded,
                                        ),
                                        suffixIcon: query.isEmpty
                                            ? null
                                            : IconButton(
                                                tooltip: 'Limpar busca',
                                                icon: const Icon(Icons.close),
                                                onPressed: () {
                                                  searchController.clear();
                                                  setState(() => query = '');
                                                },
                                              ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          borderSide: const BorderSide(
                                            color: Color(0xFFE5EAF0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                  return size.maxWidth < 560
                                      ? Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            heading,
                                            const SizedBox(height: 16),
                                            search,
                                          ],
                                        )
                                      : Row(
                                          children: [
                                            heading,
                                            const Spacer(),
                                            search,
                                          ],
                                        );
                                },
                              ),
                              const SizedBox(height: 18),
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: categories
                                    .map(
                                      (value) => ChoiceChip(
                                        label: Text(value),
                                        selected: category == value,
                                        showCheckmark: false,
                                        onSelected: (_) =>
                                            setState(() => category = value),
                                        selectedColor: hubAccent,
                                        backgroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        side: BorderSide(
                                          color: category == value
                                              ? hubAccent
                                              : const Color(0xFFDCE2EF),
                                        ),
                                        labelStyle: TextStyle(
                                          fontSize: 14,
                                          color: category == value
                                              ? Colors.white
                                              : const Color(0xFF536170),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                      if (visible.isEmpty)
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.all(40),
                            child: Column(
                              children: [
                                const Icon(
                                  Icons.search_off_rounded,
                                  size: 42,
                                  color: hubAccent,
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  'Nenhum recurso encontrado.',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Tente outra busca ou categoria.',
                                  style: TextStyle(fontSize: 16),
                                ),
                                const SizedBox(height: 12),
                                TextButton(
                                  onPressed: resetFilters,
                                  child: const Text('Limpar filtros'),
                                ),
                              ],
                            ),
                          ),
                        )
                      else
                        SliverPadding(
                          padding: EdgeInsets.fromLTRB(padding, 0, padding, 32),
                          sliver: SliverLayoutBuilder(
                            builder: (context, size) {
                              final columns = size.crossAxisExtent >= 1080
                                  ? 4
                                  : size.crossAxisExtent >= 760
                                  ? 3
                                  : size.crossAxisExtent >= 520
                                  ? 2
                                  : 1;
                              return SliverGrid(
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) =>
                                      LinkCard(link: visible[index]),
                                  childCount: visible.length,
                                ),
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: columns,
                                      crossAxisSpacing: 16,
                                      mainAxisSpacing: 16,
                                      mainAxisExtent:
                                          234 *
                                          MediaQuery.textScalerOf(
                                            context,
                                          ).scale(1),
                                    ),
                              );
                            },
                          ),
                        ),
                      const SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 20, 24),
                          child: Text(
                            'Projeto Redes • Conexões para o cuidado',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF536170),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand({this.inverse = false});
  final bool inverse;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: inverse ? const Color(0xFF4367EF) : hubAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(
          Icons.join_inner_rounded,
          color: Colors.white,
          size: 25,
        ),
      ),
      SizedBox(width: 11),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PROJETO REDES',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: inverse ? Colors.white : hubInk,
              ),
            ),
            Text(
              'Centro de conexões',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                color: inverse ? const Color(0xFFA6B6D5) : hubAccent,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

class _BannerLabel extends StatelessWidget {
  const _BannerLabel({required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 18, color: hubAccent),
      const SizedBox(width: 7),
      Flexible(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF445777),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ],
  );
}

class _NetworkPainter extends CustomPainter {
  const _NetworkPainter();
  @override
  void paint(Canvas canvas, Size size) {
    final points = [
      Offset(size.width * .16, size.height * .28),
      Offset(size.width * .65, size.height * .12),
      Offset(size.width * .48, size.height * .52),
      Offset(size.width * .92, size.height * .65),
      Offset(size.width * .15, size.height * .85),
      Offset(size.width * .68, size.height * .98),
    ];
    final line = Paint()
      ..color = const Color(0xFFBBC9F4)
      ..strokeWidth = 1.5;
    for (final edge in [
      [0, 1],
      [0, 2],
      [0, 4],
      [1, 2],
      [1, 3],
      [2, 3],
      [2, 4],
      [2, 5],
      [3, 5],
      [4, 5],
    ]) {
      canvas.drawLine(points[edge[0]], points[edge[1]], line);
    }
    for (var i = 0; i < points.length; i++) {
      canvas.drawCircle(
        points[i],
        i == 2 ? 36 : 16,
        Paint()
          ..color = i == 2
              ? const Color(0xFF3458DB)
              : i == 4
              ? const Color(0xFFE6A14A)
              : const Color(0xFFD0DAF9),
      );
      canvas.drawCircle(
        points[i],
        i == 2 ? 10 : 4,
        Paint()..color = Colors.white,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _NetworkPainter oldDelegate) => false;
}
