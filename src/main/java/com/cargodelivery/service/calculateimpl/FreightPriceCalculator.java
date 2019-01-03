package com.cargodelivery.service.calculateimpl;

import com.cargodelivery.model.Order;
import com.cargodelivery.repository.DistanceRepository;
import com.cargodelivery.repository.impl.DistanceRepositoryImpl;

import java.sql.Connection;

class FreightPriceCalculator implements CalculatorStrategy {

    private final DistanceRepository distanceRepository;

    public FreightPriceCalculator(Connection connection) {
        this.distanceRepository = new DistanceRepositoryImpl(connection);
    }

    @Override
    public int getPrice(Order order) {
        int distance = distanceRepository.getDistanceBetweenTwoCities(order.getCityFrom(), order.getCityTo());
        return (int) (1000 + distance * 0.8 * order.getWeight() / 1000 );
    }
}
