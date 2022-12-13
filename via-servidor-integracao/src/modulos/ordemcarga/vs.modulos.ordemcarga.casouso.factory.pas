unit vs.modulos.ordemcarga.casouso.factory;

interface

uses
  // TMS Aurelius
  Aurelius.Engine.ObjectManager,
  // ViaServidorIntegracao
  vs.modulos.comum.casouso.intf,
  vs.modulos.comum.dto.respostapadrao,
  vs.modulos.ordemcarga.casouso.dto.requisicao.sincronizarordemcarga,
  vs.modulos.ordemcarga.dominio.repositorio.intf;

type

  TCasoUsoFactory = class
  public
    class function SincronizarOrdemCarga: ICasoUso<TRequisicaoSincronizarOrdemCargaDto, TRespostaPadraoDto>;
  end;

implementation

uses
  // TMS XData
  XData.Server.Module,
  // ViaServidorIntegracao
  vs.infra.modulos.ordemcarga.repositorio.xdata.ordemcarga,
  vs.modulos.ordemcarga.casouso.sincronizarordemcarga,
  vs.modulos.ordemcarga.servico.integracaowms.intf,
  vs.infra.modulos.ordemcarga.servico.integracaowms.xdata;

{ TCasoUsoFactory }

class function TCasoUsoFactory.SincronizarOrdemCarga: ICasoUso<TRequisicaoSincronizarOrdemCargaDto, TRespostaPadraoDto>;
var
  LObjectManager: TObjectManager;
  LRepositorio: IOrdemCargaRepositorio;
  LServico: IIntegracaoWmsServico;
begin
  LObjectManager := TXDataOperationContext.Current.GetManager;
  LRepositorio := TOrdemCargaRepositorio.New(LObjectManager);
  LServico := TIntegracaoWmsServico.New;
  Result := TSincronizarOrdemCargaCasoUso.New(LRepositorio, LServico);
end;

end.
