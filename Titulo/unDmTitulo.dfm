object dmTitulo: TdmTitulo
  Height = 155
  Width = 372
  object cdsTitulo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspTitulo'
    Left = 292
    Top = 48
    object cdsTituloIDTITULO: TIntegerField
      FieldName = 'IDTITULO'
      Required = True
    end
    object cdsTituloNUMEROTITULO: TIntegerField
      FieldName = 'NUMEROTITULO'
    end
    object cdsTituloDATAVENCIMENTO: TStringField
      FieldName = 'DATAVENCIMENTO'
      Size = 15
    end
    object cdsTituloBANCOID: TIntegerField
      FieldName = 'BANCOID'
    end
    object cdsTituloCLIENTEID: TIntegerField
      FieldName = 'CLIENTEID'
    end
    object cdsTituloVALORTITULO: TSingleField
      FieldName = 'VALORTITULO'
    end
  end
  object dspTitulo: TDataSetProvider
    DataSet = qryTitulo
    Left = 216
    Top = 48
  end
  object qryTitulo: TFDQuery
    Active = True
    DetailFields = 'VALORTITULO'
    Connection = dmConexao.fdConnection
    SQL.Strings = (
      'select * from titulos')
    Left = 136
    Top = 48
  end
  object qryAux: TFDQuery
    Connection = dmConexao.fdConnection
    Left = 48
    Top = 48
  end
end
