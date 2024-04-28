import 'package:empresta/app/domain/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../../base/extensions/helpers/money_formater.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import '../widgets/text_form_fields/custom_text_form_field.dart';
import 'home_controller.dart';
import 'widgets/simulation_card_widget.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Simulador App',
          style: defaultTextStyle.cl(AppColors.white),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.white,
      body: Obx(
        () {
          if (controller.showLoading.value) {
            return const LinearProgressIndicator(
              color: AppColors.primaryColor,
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 5.0,
              vertical: 1.0,
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => controller.refreshAll(),
                      style: TextButton.styleFrom(
                        foregroundColor: AppColors.primaryColor,
                      ),
                      child: Text(
                        'Limpar Campos',
                        style: defaultTextStyle.cl(
                          AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 6,
                    ),
                    child: CustomTextFormField.money(
                      textEditingController: controller.moneyTextController,
                      borderColor: AppColors.black,
                      fillColor: Colors.transparent,
                      onChanged: (value) =>
                          controller.moneyTextInputCallback(value),
                      inputFormatters: [
                        MoneyFormatter(),
                        LengthLimitingTextInputFormatter(16),
                      ],
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.none,
                      labelText: 'Valor de empréstimo',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Insira o valor que deseja solicitar';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: DropdownButtonFormField(
                      key: controller.dropdownParcelsKey,
                      dropdownColor: AppColors.white,
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        filled: true,
                      ),
                      onChanged: (String? newValue) {
                        if (newValue == null) return;
                        controller.simulationRemoteEntity.parcelNumber =
                            int.parse(newValue);
                      },
                      items: AppConstants.parcelDropDownValues
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: const TextStyle(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      hint: const Text(
                        'Quantidade de parcelas',
                        style: defaultTextStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Obx(
                      () => DropdownButtonFormField(
                        key: controller.dropdownCovenantsKey,
                        dropdownColor: AppColors.white,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          filled: true,
                        ),
                        hint: const Text(
                          AppConstants.kConvenant,
                          style: defaultTextStyle,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue == null) return;

                          controller.simulationRemoteEntity.covenants
                              .assign(newValue);
                        },
                        items: controller.covenantList.map((e) {
                          return DropdownMenuItem<String>(
                            value: e.key,
                            child: Text(
                              e.key,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Obx(
                      () => DropdownButtonFormField(
                        key: controller.dropdownInstitutionsKey,
                        dropdownColor: AppColors.white,
                        decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.black,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.black,
                              width: 1,
                            ),
                          ),
                          filled: true,
                        ),
                        hint: const Text(
                          AppConstants.kInstitution,
                          style: defaultTextStyle,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue == null) return;
                          controller.simulationRemoteEntity.institutions
                              .assign(newValue);
                        },
                        items: controller.institutionList.map((e) {
                          return DropdownMenuItem<String>(
                            value: e.key,
                            child: Text(
                              e.key,
                              style: const TextStyle(fontSize: 16),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: SizedBox(
                      width: Get.width,
                      height: 50,
                      child: Obx(
                        () => TextButton(
                          style: TextButton.styleFrom(
                            foregroundColor: AppColors.primaryColor,
                            backgroundColor:
                                controller.blockSimulateButton.value
                                    ? AppColors.lightGray
                                    : AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                          onPressed: () {
                            FocusScope.of(context).unfocus();
                            controller.simulate();
                          },
                          child: Obx(
                            () {
                              if (controller.simulateLoading.value) {
                                return const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    color: AppColors.white,
                                    strokeWidth: 2,
                                  ),
                                );
                              }
                              return Text(
                                'Simular'.toUpperCase(),
                                style: defaultTextStyle.bold.cl(
                                  AppColors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: _buildSimulationsList(),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSimulationsList() {
    return Obx(
      () {
        if (controller.simulations
            .any((element) => element.simulations.isNotEmpty)) {
          return ListView(
            shrinkWrap: true,
            children: [
              ...controller.simulations.map(
                (simulation) {
                  return SimulationCard(
                    simulationFather: simulation,
                    valuePrice: controller.moneyTextController.text,
                  );
                },
              ),
            ],
          );
        }

        return ListView(
          shrinkWrap: false,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Text(
                    'Nenhum Resultado',
                    style: defaultTextStyle,
                  ),
                ),
                const Text(
                  'Digite novos termos para simular',
                  style: defaultTextStyle,
                ),
                Center(
                  child: Lottie.asset(
                    'lib/app/assets/empty_result.json',
                    width: 160,
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
