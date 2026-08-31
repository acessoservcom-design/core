enum Role {
  adminEmpresa,
  adminLoja,
  gerente,
  vendedor,
  atendentePedidos,
  producao;

  String get displayName {
    switch (this) {
      case Role.adminEmpresa:
        return 'Admin Empresa';
      case Role.adminLoja:
        return 'Admin Loja';
      case Role.gerente:
        return 'Gerente';
      case Role.vendedor:
        return 'Vendedor';
      case Role.atendentePedidos:
        return 'Atendente Pedidos';
      case Role.producao:
        return 'Produção';
    }
  }

  static Role fromString(String value) {
    switch (value) {
      case 'admin_empresa':
        return Role.adminEmpresa;
      case 'admin_loja':
        return Role.adminLoja;
      case 'gerente':
        return Role.gerente;
      case 'vendedor':
        return Role.vendedor;
      case 'atendente_pedidos':
        return Role.atendentePedidos;
      case 'producao':
        return Role.producao;
      default:
        return Role.vendedor;
    }
  }

  String get value {
    switch (this) {
      case Role.adminEmpresa:
        return 'admin_empresa';
      case Role.adminLoja:
        return 'admin_loja';
      case Role.gerente:
        return 'gerente';
      case Role.vendedor:
        return 'vendedor';
      case Role.atendentePedidos:
        return 'atendente_pedidos';
      case Role.producao:
        return 'producao';
    }
  }

  Set<String> get defaultMenuKeys {
    return switch (this) {
      Role.adminEmpresa => _todosMenus,
      Role.adminLoja => _todosMenus,
      Role.gerente => _todosMenus,
      Role.vendedor => {
          'dashboard', 'pdv', 'clientes', 'orcamentos', 'vendas_gestao',
          'comissoes', 'lancamentos', 'nfce', 'pedidos',
          'caixa_abertura', 'caixa_fechamento', 'caixa_historico',
        },
      Role.atendentePedidos => {
          'clientes', 'pedidos',
          'pdv',
        },
      Role.producao => {
          'estoque_consulta', 'movimentacao', 'inventario', 'lotes',
        },
    };
  }

  static const _todosMenus = {
    'dashboard', 'pdv', 'clientes', 'orcamentos', 'vendas_gestao',
    'comissoes', 'lancamentos', 'nfce', 'nfe',
    'estoque_consulta', 'movimentacao', 'inventario', 'lotes',
    'fornecedores', 'transportadoras', 'vendedores', 'tabelas_preco',
    'pedidos_compra', 'entradas_mercadoria', 'gestao_compras',
    'contas_pagar', 'contas_receber', 'fluxo_caixa',
    'relatorio_vendas', 'relatorio_estoque', 'dashboard_gerencial',
    'pedidos', 'taxas', 'modulos', 'lojas', 'usuarios', 'permissoes', 'logs',
    'caixa_abertura', 'caixa_fechamento', 'caixa_historico',
  };
}
